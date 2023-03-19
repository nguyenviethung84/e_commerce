part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> categories;

  const ProductLoaded({this.categories = const <Product>[]});

  @override
  List<Object> get props => [categories];
}
