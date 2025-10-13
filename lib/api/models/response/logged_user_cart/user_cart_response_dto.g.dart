// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartResponseDto _$UserCartResponseDtoFromJson(Map<String, dynamic> json) =>
    UserCartResponseDto(
      status: json['status'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : UserCartDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCartResponseDtoToJson(
        UserCartResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };
