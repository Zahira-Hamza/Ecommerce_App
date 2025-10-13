import '../../../../domain/entities/response/add_product_to_cart/add_product_response.dart';
import '../../../../domain/entities/response/logged_user_cart/user_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<AddProductResponse> addProductToCart(String productId);
  Future<UserCartResponse> getUserCart();
}
