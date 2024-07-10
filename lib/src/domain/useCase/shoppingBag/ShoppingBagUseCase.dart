import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/GetProductShoppingBagUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/shoppingBag/GetTotalShoppingBagUseCase.dart';

class ShoppingBagUseCase {
  //(7)
  AddShoppingBagUseCase add;
  GetProductShoppingBagUseCase getProducts;
  DeleteItemShoppingBagUseCase deleteItem;
  DeleteShoppingBagUseCase deleteShopping;
  GetTotalShoppingBagUseCase getTotal;

  ShoppingBagUseCase(
      {required this.add,
      required this.getProducts,
      required this.deleteItem,
      required this.deleteShopping,
      required this.getTotal});
}
