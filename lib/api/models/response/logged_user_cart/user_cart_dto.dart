import 'package:json_annotation/json_annotation.dart';

import 'logged_user_products_dto.dart';

part 'user_cart_dto.g.dart';

@JsonSerializable()
class UserCartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<LoggedUserProductsDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  UserCartDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory UserCartDto.fromJson(Map<String, dynamic> json) {
    return _$UserCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserCartDtoToJson(this);
  }
}
