import 'package:proyecto_flutter/src/domain/models/product.dart';

abstract class ShoppingBagRepository {
  //metodo para guardar en el carrito sesion (1)
  Future<void> add(Product product);
  Future<List<Product>> getProducts();
  Future<void> deleteItem(Product product);
  Future<void> deleteShoppingBag();
  Future<double> getTotal();
}
