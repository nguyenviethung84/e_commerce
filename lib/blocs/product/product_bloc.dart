import 'dart:async';

import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository, super(ProductLoading()) {
    on<LoadProducts>(_loadCategoriesToState);
    on<UpdateProducts>(_updateCategoriesToState);
  }

  void _loadCategoriesToState(LoadProducts event, Emitter<ProductState> emit){
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProducts()
        .listen((categories)=>add(UpdateProducts(categories)));
  }

  void _updateCategoriesToState(UpdateProducts event, Emitter<ProductState> emit){
    ProductLoaded(categories: event.products);
  }
}
