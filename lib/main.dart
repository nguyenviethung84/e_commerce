import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'screens/screens.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(LoadWishlist()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(LoadCart()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          )
        ),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
