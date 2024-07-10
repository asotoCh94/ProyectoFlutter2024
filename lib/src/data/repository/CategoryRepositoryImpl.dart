import 'dart:io';

import 'package:proyecto_flutter/src/data/dataSource/remote/service/CategoryService.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryService categoryService;

  CategoryRepositoryImpl(this.categoryService);

  @override
  Future<Resource<Category>> create(Category category, File file) {
    return categoryService.create(category, file);
  }

  @override
  Future<Resource<List<Category>>> getCategories() {
    return categoryService.getCategories();
  }

  @override
  Future<Resource<Category>> update(int id, Category category, File? file) {
    if(file == null){
      return categoryService.update(id, category);
    }
    else{
      return categoryService.updateImage(id, category, file);
    }
    
  }
  
  @override
  Future<Resource<bool>> delete(int id) {
    return categoryService.delete(id);
  }
}
