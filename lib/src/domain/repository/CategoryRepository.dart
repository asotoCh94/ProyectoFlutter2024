
import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

abstract class CategoryRepository {
  Future<Resource<Category>> create(Category category,File file);
  Future<Resource<Category>> update(int id, Category category, File? file);
  Future<Resource<List<Category>>> getCategories();
  Future<Resource<bool>> delete(int id);
}
