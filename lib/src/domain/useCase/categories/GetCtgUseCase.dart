import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';

class GetCtgUseCase {
  CategoryRepository categoryRepository;
  GetCtgUseCase(this.categoryRepository);
  run() => categoryRepository.getCategories();
}
