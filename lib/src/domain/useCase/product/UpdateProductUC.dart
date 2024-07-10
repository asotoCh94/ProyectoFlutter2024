import 'dart:io';

import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';

import '../../models/product.dart';

class UpdateProductUC {
  ProductRepository productRepository;
  UpdateProductUC(this.productRepository);

  run(int id, Product product, List<File>? files, List<int>? imageToUpdate) =>productRepository.update(id, product, files, imageToUpdate);
}
