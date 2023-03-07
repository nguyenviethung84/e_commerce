import 'package:e_commerce/models/category_model.dart';
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
    return const Scaffold(
      appBar: CustomAppBar(title: "Catalog",),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}