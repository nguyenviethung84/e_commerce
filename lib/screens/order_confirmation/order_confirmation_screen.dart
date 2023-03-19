import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              Stack(
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 300,
                  ),
                  Positioned(
                    top: 125,
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    child: SvgPicture.asset('assets/svgs/FloralMandala.svg')
                  ),
                  Positioned(
                    top: 250,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Your order is completed!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
