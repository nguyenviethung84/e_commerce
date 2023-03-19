import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0),
                            child: Text(
                              'Add more item',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 380,
                      child: ListView.builder(
                          // itemCount: state.cart.products.length,
                        itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                              quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                            );
                          }),
                    ),
                  ],
                ),
                const OrderSummary(),
              ],
            ),
          );
        } else {
          return const Text('Something were wrong');
        }
      }),
    );
  }
}
