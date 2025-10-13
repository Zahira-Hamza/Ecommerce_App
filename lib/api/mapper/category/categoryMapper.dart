import 'package:e_commerce_app/api/models/common/category_dto.dart';

import '../../../domain/entities/common/category.dart';

extension Categorymapper on CategoryDto {
  Category toCategory() {
    return Category(
      id: id,
      name: name,
      image: image,
    );
  }
}
