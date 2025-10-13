import 'package:e_commerce_app/api/models/common/sub_category_dto.dart';

import '../../../domain/entities/common/sub_category.dart';

extension Subcategorymapper on SubCategoryDto {
  SubCategory toSubCategory() {
    return SubCategory(id: id, slug: slug, name: name, category: category);
  }
}
