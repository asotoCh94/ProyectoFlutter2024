import 'package:proyecto_flutter/src/domain/useCase/categories/CreateCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/DeleteCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/GetCtgUseCase.dart';
import 'package:proyecto_flutter/src/domain/useCase/categories/UpdateCtgUseCase.dart';

class CtgUseCases {
  CreateCtgUseCase create;
  GetCtgUseCase getCategories;
  UpdateCtgUseCase update;
  DeleteCtgUseCase delete;

  CtgUseCases({
    required this.create,
    required this.getCategories,
    required this.update,
    required this.delete,
  });
}
