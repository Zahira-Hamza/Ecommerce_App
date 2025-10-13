import 'package:e_commerce_app/api/models/common/brand_dto.dart';

import '../../../domain/entities/common/brand.dart';

extension BrandMapper on BrandDto {
  Brand toBrand() {
    return Brand(
      id: id,
      name: name,
      image: image,
    );
  }
}
