import 'package:e_commerce_app/api/models/response/add_product_to_cart/products_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_dto.g.dart';

@JsonSerializable()
class CartItemDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<ProductsCartDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  CartItemDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemDtoToJson(this);
  }
}
