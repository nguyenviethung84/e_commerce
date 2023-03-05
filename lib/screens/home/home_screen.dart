import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/models/models.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(title: "Zero to Hero",),
      bottomNavigationBar: const CustomNavBar(),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        // items: imageSliders,
        items: Category.categories.map(
          (category) => HeroCarouselSlider(category: category,)
        ).toList(),
      ),
    );
  }
}

