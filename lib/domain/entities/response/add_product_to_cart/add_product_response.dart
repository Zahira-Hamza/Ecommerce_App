import 'package:e_commerce_app/domain/entities/response/add_product_to_cart/cart_item.dart';

class AddProductResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final CartItem? cartItem;

  AddProductResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.cartItem,
  });
}
