import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen()
    );
  }
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Zero to Hero",),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}