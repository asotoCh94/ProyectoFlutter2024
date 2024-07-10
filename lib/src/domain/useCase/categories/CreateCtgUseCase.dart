import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';

class CreateCtgUseCase {
  CategoryRepository categoryRepository;

  CreateCtgUseCase(this.categoryRepository);

  run(Category category, File file) => categoryRepository.create(category, file);
}
