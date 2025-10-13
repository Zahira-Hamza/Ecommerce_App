// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserProductsDto _$LoggedUserProductsDtoFromJson(
        Map<String, dynamic> json) =>
    LoggedUserProductsDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoggedUserProductsDtoToJson(
        LoggedUserProductsDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
