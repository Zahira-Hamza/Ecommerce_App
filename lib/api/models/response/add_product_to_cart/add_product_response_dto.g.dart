// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponseDto _$AddProductResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddProductResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cartId: json['cartId'] as String?,
      cartItem: json['data'] == null
          ? null
          : CartItemDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseDtoToJson(
        AddProductResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.cartItem,
    };
