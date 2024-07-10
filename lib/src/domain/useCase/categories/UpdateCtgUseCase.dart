import 'dart:io';

import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/repository/CategoryRepository.dart';

class UpdateCtgUseCase {
  CategoryRepository categoryRepository;

  UpdateCtgUseCase(this.categoryRepository);

  run(int id, Category category, File? file) =>categoryRepository.update(id, category, file);
}
