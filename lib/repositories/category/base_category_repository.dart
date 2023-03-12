import 'package:e_commerce/models/models.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}