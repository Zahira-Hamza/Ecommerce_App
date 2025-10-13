import 'package:e_commerce_app/api/models/response/logged_user_cart/user_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_cart_response_dto.g.dart';

@JsonSerializable()
class UserCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final UserCartDto? data;

  UserCartResponseDto({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory UserCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserCartResponseDtoToJson(this);
  }
}
