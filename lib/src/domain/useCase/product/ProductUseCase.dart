import 'package:proyecto_flutter/src/domain/useCase/product/CreateProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/DeleteProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/GetProductUC.dart';
import 'package:proyecto_flutter/src/domain/useCase/product/UpdateProductUC.dart';

class ProductUseCase {
  CreateProductUC create;
  GetProductUC getProductUC;
  UpdateProductUC update;
  DeleteProductUC delete;

  ProductUseCase(
      {required this.create, 
      required this.getProductUC, 
      required this.update, 
      required this.delete 
  });
}
