import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  static List<Product> products = [
    const Product(
      name: 'Soft Drinks #1', 
      category: 'Soft Drinks', 
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
      price: 1.99, 
      isRecommended: true, 
      isPopular: false
    ),
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
      name: 'Smoothy #1', 
      category: 'Smoothy', 
      imageUrl: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80', 
      price: 4.99, 
      isRecommended: false, 
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
  ];
}