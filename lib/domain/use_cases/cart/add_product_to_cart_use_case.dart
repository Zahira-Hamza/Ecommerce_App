import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/response/add_product_to_cart/add_product_response.dart';

@injectable
class AddProductToCartUseCase {
  CartRepository cartRepository;
  AddProductToCartUseCase(this.cartRepository);
  Future<AddProductResponse> invoke(String productId) {
    return cartRepository.addProductToCart(productId);
  }
}
