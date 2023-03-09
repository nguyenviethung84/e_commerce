import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  Cart();

  double get subtotal =>
    products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal){
    if(subtotal >= 30.0){
      return 0.0;
    }else {
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal){
    if(subtotal >= 30.0){
      return 'You have Free Delivery';
    }else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  static List<Product> products = [
    const Product(
        name: 'Soft Drinks #2',
        category: 'Soft Drinks',
        imageUrl: 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: true
    ),
    const Product(
        name: 'Soft Drinks #3',
        category: 'Soft Drinks',
        imageUrl: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        price: 3.99,
        isRecommended: true,
        isPopular: true
    ),
    const Product(
        name: 'Soft Drinks #5',
        category: 'Soft Drinks',
        imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        price: 5.99,
        isRecommended: true,
        isPopular: false
    ),
    const Product(
        name: 'Smoothy #1',
        category: 'Smoothy',
        imageUrl: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        price: 4.99,
        isRecommended: false,
        isPopular: true
    ),
  ];

  @override
  List<Object?> get props => [];
}