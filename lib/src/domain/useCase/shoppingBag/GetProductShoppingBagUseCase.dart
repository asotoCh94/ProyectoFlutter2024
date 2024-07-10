

import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';

class GetProductShoppingBagUseCase{

  //(4)
  ShoppingBagRepository shoppingBagRepository;

  GetProductShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getProducts();
}