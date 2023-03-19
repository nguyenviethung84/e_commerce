import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  const OrderConfirmation({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Order...",
        ),
        bottomNavigationBar: const CustomNavBar(
          screen: routeName,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
              )
            ],
          ),
        )
    );
  }
}
