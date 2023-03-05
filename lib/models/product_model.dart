import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });
  
  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
    isRecommended,
    isPopular,
  ];

  static List<Product> products = [
    const Product(
      name: 'Soft Drinks #1', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 2.99, 
      isRecommended: true, 
      isPopular: false
    ),
    const Product(
      name: 'Soft Drinks #2', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 2.99, 
      isRecommended: true, 
      isPopular: false
    ),
    const Product(
      name: 'Soft Drinks #3', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 2.99, 
      isRecommended: true, 
      isPopular: false
    ),
    const Product(
      name: 'Soft Drinks #4', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 2.99, 
      isRecommended: true, 
      isPopular: false
    ),
    const Product(
      name: 'Soft Drinks #5', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 2.99, 
      isRecommended: true, 
      isPopular: false
    ),
  ];
}