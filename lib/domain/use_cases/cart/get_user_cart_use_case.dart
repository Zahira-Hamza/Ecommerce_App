import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/response/logged_user_cart/user_cart_response.dart';

@injectable
class GetUserCartUseCase {
  CartRepository cartRepository;
  GetUserCartUseCase({required this.cartRepository});

  Future<UserCartResponse> invoke() {
    return cartRepository.getUserCart();
  }
}
