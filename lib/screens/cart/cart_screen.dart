import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen()
    );
  }
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Cart",),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context).textTheme.headline3!,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add \$20 for FREE Delivery',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(),
                        elevation: 0
                      ),
                      child: Text(
                        'Add more item',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                CartProductCard(product: Product.products[0],),
                CartProductCard(product: Product.products[1],),
              ],
            ),

            Column(
              children: [
                const Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\$5.98',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\$1.90',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(5.0),
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$8.90',
                              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
