import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart.dart';

class UserCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final UserCart? data;

  UserCartResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
