import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  }) : _cartBloc = cartBloc,
  _checkoutRepository = checkoutRepository,
    super(
        cartBloc.state is CartLoaded
          ? CheckoutLoaded(
            products: (cartBloc.state as CartLoaded).cart.products,
            subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
            deliveryFee: (cartBloc.state as CartLoaded).cart.freeDeliveryString,
            total: (cartBloc.state as CartLoaded).cart.totalString,
          )
          : CheckoutLoading()
    ) {
      _cartSubscription = cartBloc.stream.listen((state) {
        if(state is CartLoaded){
          add(UpdateCheckout(cart: state.cart));
        }
      });
      on<UpdateCheckout>(_onUpdateCheckout as EventHandler<UpdateCheckout, CheckoutState>);
      on<ConfirmCheckout>(_onConfirmCheckout as EventHandler<ConfirmCheckout, CheckoutState>);
  }

  void _onUpdateCheckout(UpdateCheckout event, CheckoutState state){
    if(state is CheckoutLoaded){
      CheckoutLoaded(
        fullName: event.fullName ?? state.fullName,
        email: event.email ?? state.email,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
        products: event.cart?.products ?? state.products,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        total: event.cart?.totalString ?? state.total,
      );
    }
  }

  Future<void> _onConfirmCheckout(ConfirmCheckout event, CheckoutState state) async {
    if(state is CheckoutLoaded){
      try{
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        CheckoutLoading();
      }catch (_){}
    }
  }
}
