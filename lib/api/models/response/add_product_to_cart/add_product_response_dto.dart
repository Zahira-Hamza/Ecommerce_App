import 'package:json_annotation/json_annotation.dart';

import 'cart_item_dto.dart';

part 'add_product_response_dto.g.dart';

@JsonSerializable()
class AddProductResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final CartItemDto? cartItem;

  AddProductResponseDto({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.cartItem,
  });

  factory AddProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductResponseDtoToJson(this);
  }
}
