import 'dart:async';

import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository, super(CategoryLoading()) {
    on<LoadCategories>(_loadCategoriesToState);
    on<UpdateCategories>(_updateCategoriesToState);
  }

  void _loadCategoriesToState(LoadCategories event, Emitter<CategoryState> emit){
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository
    .getAllCategories()
    .listen((categories)=>add(UpdateCategories(categories)));
  }

  void _updateCategoriesToState(UpdateCategories event, Emitter<CategoryState> emit){
    CategoryLoaded(categories: event.categories);
  }
}
