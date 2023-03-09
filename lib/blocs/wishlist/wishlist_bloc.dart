
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddWishlistProduct>(_onAddWishlistProduct);
    on<RemoveWishlistProduct>(_onRemoveWishlistProduct);
  }

  void _onStartWishlist(StartWishlist event, Emitter<WishlistState> emit){
    emit(
      WishlistLoaded(wishlist: event.wishlist)
    );
  }

  void _onAddWishlistProduct(AddWishlistProduct event, Emitter<WishlistState> emit){
    final state = this.state;
    if (state is WishlistLoaded) {
      emit(
        WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product)
          )
        )
      );
    }
  }

  void _onRemoveWishlistProduct(RemoveWishlistProduct event, Emitter<WishlistState> emit){
    final state = this.state;
    if (state is WishlistLoaded) {
      emit(
        WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product)
          )
        )
      );
    }
  }
}
