import 'package:json_annotation/json_annotation.dart';

part 'products_cart_dto.g.dart';

@JsonSerializable()
class ProductsCartDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  ProductsCartDto({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory ProductsCartDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsCartDtoToJson(this);
  }
}
