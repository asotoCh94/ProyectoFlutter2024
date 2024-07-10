import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';

class CreateProductUC {
  ProductRepository productRepository;

  CreateProductUC(this.productRepository);

  run(Product product, List<File> files) =>productRepository.create(product, files);
}
