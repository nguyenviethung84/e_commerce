import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Zero to Hero",
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName,),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if(state is CategoryLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is CategoryLoaded){
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  // items: imageSliders,
                  items: Category.categories
                      .map((category) =>
                      HeroCarouselSlider(
                        category: category,
                      ))
                      .toList(),
                );
              }else{
                return const Text('Something went wrong!');
              }

            },
          ),
          const SectionTitle(
            title: 'RECOMMENDED',
          ),
          ProductCarousel(products: Product.products.where(
                  (product) => product.isRecommended).toList()
          ),
          const SectionTitle(
            title: 'MOST POPULAR',
          ),
          ProductCarousel(products: Product.products.where(
                  (product) => product.isPopular).toList()
          ),
        ],
      ),
    );
  }
}

