import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';

class GetProductUC {
  ProductRepository productRepository;
  GetProductUC(this.productRepository);

  run(int idCategory) => productRepository.getProductsByCategory(idCategory);
}
