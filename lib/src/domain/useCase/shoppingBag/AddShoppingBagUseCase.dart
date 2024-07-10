import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';

class AddShoppingBagUseCase {
  //(3)
  ShoppingBagRepository shoppingBagRepository;

  AddShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.add(product);
}
