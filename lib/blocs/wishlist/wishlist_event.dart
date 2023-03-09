part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent {
  final Wishlist wishlist;

  const StartWishlist({this.wishlist = const Wishlist()});

  @override
  List<Object> get props => [wishlist];
}

class AddWishlistProduct extends WishlistEvent {
  final Product product;
  
  const AddWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent {
  final Product product;
  
  const RemoveWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}
