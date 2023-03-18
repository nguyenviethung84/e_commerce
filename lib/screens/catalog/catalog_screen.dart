import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  final Category category;
  const CatalogScreen({super.key, required this.category});
  
  static Route route({required Category category}){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category,)
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = 
    Product.products.where((product) => product.category == category.name).toList();

    return Scaffold(
      appBar: CustomAppBar(title: category.name,),
      bottomNavigationBar: const CustomNavBar(screen: routeName,),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15
        ),
        itemCount: categoryProducts.length, 
        itemBuilder: (BuildContext context, int index){
          return Center(child: ProductCard(
            product: categoryProducts[index],
            withFactor: 2.2,
          ));
        }
      ),
    );
  }
}