import 'package:e_commerce_app/api/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/add_product_to_cart/add_product_response.dart';
import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<AddProductResponse> addProductToCart(String productId) {
    // TODO: implement addProductToCart
    return cartRemoteDataSource.addProductToCart(productId);
  }

  @override
  Future<UserCartResponse> getUserCart() {
    // TODO: implement getUserCart
    return cartRemoteDataSource.getUserCart();
  }
}
