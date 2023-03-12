import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen()
    );
  }


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), ()=>Navigator.pushNamed(context, '/'));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/images/logo.jpg'),
              height: 125,
              width: 125,
            ),
          ),
          const SizedBox(height: 30.0,),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'HungNV',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
            ),
          )
        ],
      )
    );
  }
}