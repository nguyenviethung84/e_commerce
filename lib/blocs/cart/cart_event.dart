part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  final Cart cart;

  const CartStarted({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Product product;

  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
