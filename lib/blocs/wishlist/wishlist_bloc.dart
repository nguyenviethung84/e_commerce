import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}