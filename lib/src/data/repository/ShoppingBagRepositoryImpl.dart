import 'package:proyecto_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/domain/repository/ShoppingBagRepository.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {
  //(2)
  SharedPref sharedPref;

  ShoppingBagRepositoryImpl(this.sharedPref);
  @override
  Future<void> add(Product product) async {
    // TODO: implement add agregar producto a la bolsa
    //TRAEMOS INFORMACION DEL SHAR
    final data = await sharedPref.read('shopping_bag');
    List<Product> selectProduct = [];
    //si no trae nada llenamos
    if (data == null) {
      selectProduct.add(product);
      //guardamos la informacion
      await sharedPref.save('shopping_bag', selectProduct);
    } else {
      //si hay data
      //obtenemos la lista q esta almacenada en al bolsa de compra
      selectProduct = Product.fromJsonList(data).toList();
      int index = selectProduct.indexWhere((p) => p.id == product.id);
      if (index == -1) {
        //producto no existe en la bolsa - añadir
        product.quantity ??= 1;
        selectProduct.add(product);
      } else {
        //producto existe - modificara
        selectProduct[index].quantity = product.quantity;
      }
      //guardamos la informacion
      await sharedPref.save('shopping_bag', selectProduct);
    }
  }

  @override
  Future<void> deleteItem(Product product) async {
    // TODO: implement deleteItem
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return;
    }
    List<Product> selectProduct = Product.fromJsonList(data).toList();
    selectProduct.removeWhere((p) => p.id == product.id);
    await sharedPref.save('shopping_bag', selectProduct);
  }

  @override
  Future<void> deleteShoppingBag() async {
    // TODO: implement deleteShoppingBag
    await sharedPref.remove('shopping_bag');
  }

  @override
  Future<List<Product>> getProducts() async {
    // TODO: implement getProducts
    //TRAEMOS INFORMACION DEL SHAR
    final data = await sharedPref.read('shopping_bag');

    if (data == null) {
      return [];
    }
    List<Product> selectProduct = Product.fromJsonList(data).toList();
    return selectProduct;
  }

  @override
  Future<double> getTotal() async {
    //TRAEMOS INFORMACION DEL SHAR
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return 0;
    }
    double total = 0;
    List<Product> selectProduct = Product.fromJsonList(data).toList();
    selectProduct.forEach((product) {
      total = total + (product.quantity! * product.price!);
    });
    return total;
  }
}
