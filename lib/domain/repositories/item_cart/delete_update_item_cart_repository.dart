import '../../entities/response/logged_user_cart/user_cart_response.dart';

abstract class DeleteUpdateItemCartRepository {
  Future<UserCartResponse> deleteItemCart(String productId);

  Future<UserCartResponse> updateItemCountCart(String productId, int itemCount);
}
