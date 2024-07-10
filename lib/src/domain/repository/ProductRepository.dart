import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';

abstract class ProductRepository {
  Future<Resource<Product>> create(Product product, List<File> files);
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory);
  Future<Resource<Product>> update(int id, Product product, List<File>? files, List<int>? imageToUpdate);
  Future<Resource<bool>> delete(int id);
}
