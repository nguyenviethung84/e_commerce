import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;
  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _selectNavBar(context, screen)!,
          ),
        )
    );
  }

  List<Widget>? _selectNavBar(context, screen){
    switch(screen){
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        _buildNavBar(context);
    }
    return null;
  }

  List<Widget>? _buildNavBar(context){
    return  [
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.home, color: Colors.white,)
      ),
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.white,)
      ),
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/user');
          },
          icon: const Icon(Icons.person, color: Colors.white,)
      ),
    ];
  }

  List<Widget>? _buildAddToCartNavBar(context, product){
    return [
      IconButton(
        onPressed: (){},
        icon: const Icon(Icons.share, color: Colors.white,)
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is WishlistLoaded){
            return IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                context
                    .read<WishlistBloc>()
                    .add(AddWishlistProduct(product));
                const snackBar =
                SnackBar(content: Text('Added to your Wishlist'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // context.read<WishlistBloc>().add(AddWishlistProduct(product));
              },
            );
          }else{
            return const Text('Something were wrong');
          }
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is CartLoaded){
            return ElevatedButton(
              onPressed: (){
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
              child: Text(
                'ADD TO CART',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            );
          }else{
            return const Text('Something were wrong');
          }

        },
      ),
    ];
  }

  List<Widget>? _buildGoToCheckoutNavBar(context){
    return [
      ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, '/checkout');
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder()
          ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.displaySmall,
        )
      ),
    ];
  }

  List<Widget>? _buildOrderNowNavBar(context){
    return [
      ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder()
          ),
          child: Text(
            'ORDER NOW',
            style: Theme.of(context).textTheme.displaySmall,
          )
      ),
    ];
  }
}
