import '../../../../domain/entities/response/logged_user_cart/user_cart_response.dart';

abstract class DeleteUpdateItemCartRemoteDs {
  Future<UserCartResponse> deleteItemCart(String productId);

  Future<UserCartResponse> updateItemCountCart(String productId, int itemCount);
}
