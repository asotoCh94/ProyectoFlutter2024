
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppingBagUseCase{
   //(5)
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.deleteItem(product);
}