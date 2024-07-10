import 'dart:io';

import 'package:proyecto_flutter/src/data/dataSource/remote/service/ProductService.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';

import '../../domain/utils/Resource.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductSevice productSevice;

  ProductRepositoryImpl(this.productSevice);

  @override
  Future<Resource<Product>> create(Product product, List<File> files) {
    return productSevice.create(product, files);
  }

  @override
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory) {
    // TODO: implement getProductsByCategory
    return productSevice.getProductsByCategory(idCategory);
  }

  @override
  Future<Resource<Product>> update(
      int id, Product product, List<File>? files, List<int>? imageToUpdate) {
    // TODO: implement update
    // ignore: unnecessary_null_comparison
    if (files != null &&
        imageToUpdate != null &&
        files.isNotEmpty &&
        imageToUpdate.isNotEmpty) {
      return productSevice.updateWithImages(id, product, files, imageToUpdate);
    } else {
      return productSevice.update(id, product);
    }
  }

  @override
  Future<Resource<bool>> delete(int id) {
    // TODO: implement delete
    return productSevice.delete(id);
  }
}
