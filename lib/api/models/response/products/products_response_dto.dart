import 'package:e_commerce_app/api/models/common/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/metadata_dto.dart';

part 'products_response_dto.g.dart';

@JsonSerializable()
class ProductsResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductsResponseDto({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseDtoToJson(this);
  }
}
