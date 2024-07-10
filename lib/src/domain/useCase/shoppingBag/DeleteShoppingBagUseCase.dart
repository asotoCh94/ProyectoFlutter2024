import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';

class DeleteShoppingBagUseCase{
    //(6)
  ShoppingBagRepository shoppingBagRepository;

  DeleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}