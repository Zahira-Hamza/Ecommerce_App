import 'package:e_commerce_app/api/mapper/brands/brandMapper.dart';
import 'package:e_commerce_app/api/mapper/category/categoryMapper.dart';
import 'package:e_commerce_app/api/mapper/product/subCategoryMapper.dart';

import '../../../domain/entities/common/product.dart';
import '../../models/common/product_dto.dart';

extension Productmapper on ProductDto {
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      quantity: quantity,
      imageCover: imageCover,
      slug: slug,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      images: images,
      subcategory: subcategory
          ?.map((subCategoryDto) => subCategoryDto.toSubCategory())
          .toList(),
      category: category?.toCategory(),
      brand: brand?.toBrand(),
    );
  }
}
