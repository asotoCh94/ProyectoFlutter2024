import 'package:proyecto_flutter/src/domain/repository/ProductRepository.dart';

class DeleteProductUC {
  ProductRepository productRepository;

  DeleteProductUC(this.productRepository);

  run(int id) => productRepository.delete(id);
}
