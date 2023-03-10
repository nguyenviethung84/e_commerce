import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemoved>(_onCartProductRemoved);
  }

  void _onCartStarted(CartStarted event, Emitter<CartState> emit){
    emit(
      CartLoaded(cart: event.cart)
    );
  }
  void _onCartProductAdded(CartProductAdded event, Emitter<CartState> emit){
    final state = this.state;
    if (state is CartLoaded) {
      emit(
        CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product)
          )
        ),
      );
    }
  }
  void _onCartProductRemoved(CartProductRemoved event, Emitter<CartState> emit){
    final state = this.state;
    if (state is CartLoaded) {
      emit(
        CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product)
          )
        ),
      );
    }
  }
}
