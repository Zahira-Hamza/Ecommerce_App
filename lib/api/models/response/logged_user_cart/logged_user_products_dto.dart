import 'package:e_commerce_app/api/models/common/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user_products_dto.g.dart';

@JsonSerializable()
class LoggedUserProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;

  LoggedUserProductsDto({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory LoggedUserProductsDto.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoggedUserProductsDtoToJson(this);
  }
}
