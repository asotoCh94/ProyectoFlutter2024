import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';

class DeleteCtgUseCase{

  CategoryRepository categoryRepository;
  DeleteCtgUseCase(this.categoryRepository);
  run(int id) => categoryRepository.delete(id);
}