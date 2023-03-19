import 'package:e_commerce/models/models.dart';

abstract class BaseCheckoutRepository{
  Future<void> addCheckout(Checkout checkout);
}