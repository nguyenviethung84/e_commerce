import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Check out",
        ),
        bottomNavigationBar: const CustomNavBar(
          screen: routeName,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if(state is CheckoutLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall,
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                        UpdateCheckout(email: value)
                      );
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(fullName: value)
                      );
                    }, context, 'Full Name'),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall,
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(address: value)
                      );
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(city: value)
                      );
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(country: value)
                      );
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(zipCode: value)
                      );
                    }, context, 'Zip Code'),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall,
                    ),
                  ],
                );
              } else {
                return const Text('Something were wrong');
              }
            },
          ),
        ));
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                ))),
          )),
        ],
      ),
    );
  }
}
