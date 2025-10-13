// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsCartDto _$ProductsCartDtoFromJson(Map<String, dynamic> json) =>
    ProductsCartDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsCartDtoToJson(ProductsCartDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
