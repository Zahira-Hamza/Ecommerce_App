import 'package:e_commerce_app/api/mapper/product/productMapper.dart';
import 'package:e_commerce_app/api/models/response/add_product_to_cart/add_product_response_dto.dart';
import 'package:e_commerce_app/domain/entities/response/add_product_to_cart/add_product_response.dart';

import '../../../domain/entities/common/products_cart.dart';
import '../../../domain/entities/response/add_product_to_cart/cart_item.dart';
import '../../../domain/entities/response/logged_user_cart/logged_user_product.dart';
import '../../../domain/entities/response/logged_user_cart/user_cart.dart';
import '../../../domain/entities/response/logged_user_cart/user_cart_response.dart';
import '../../models/response/add_product_to_cart/cart_item_dto.dart';
import '../../models/response/add_product_to_cart/products_cart_dto.dart';
import '../../models/response/logged_user_cart/logged_user_products_dto.dart';
import '../../models/response/logged_user_cart/user_cart_dto.dart';
import '../../models/response/logged_user_cart/user_cart_response_dto.dart';

extension CartMapper on AddProductResponseDto {
  AddProductResponse toEntity() {
    return AddProductResponse(
      message: message ?? '',
      status: status ?? '',
      numOfCartItems: numOfCartItems ?? 0,
      cartId: cartId ?? '',
      cartItem:
          cartItem?.toEntity(), // Fixed parameter name and added null safety
    );
  }
}

extension CartItemMapper on CartItemDto {
  CartItem toEntity() {
    return CartItem(
      id: id ?? '',
      cartOwner: cartOwner ?? '',
      products:
          products?.map((productDto) => productDto.toEntity()).toList() ?? [],
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      v: v ?? 0,
      totalCartPrice: totalCartPrice ?? 0,
    );
  }
}

extension ProductsCartMapper on ProductsCartDto {
  ProductsCart toEntity() {
    return ProductsCart(
      count: count ?? 0,
      id: id ?? '',
      product: product ?? '',
      price: price ?? 0,
    );
  }
}

extension UserCartMapper on UserCartResponseDto {
  UserCartResponse toEntity() {
    return UserCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toEntity(),
    );
  }
}

extension UserCartDataMapper on UserCartDto {
  UserCart toEntity() {
    return UserCart(
      id: id,
      cartOwner: cartOwner,
      products: products?.map((productDto) => productDto.toEntity()).toList(),
      totalCartPrice: totalCartPrice,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}

extension UserCartProductsMapper on LoggedUserProductsDto {
  LoggedUserProducts toEntity() {
    return LoggedUserProducts(
      id: id,
      count: count,
      product: product?.toProduct(),
      price: price,
    );
  }
}
