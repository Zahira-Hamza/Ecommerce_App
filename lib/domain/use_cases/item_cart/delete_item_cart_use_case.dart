import 'package:injectable/injectable.dart';

import '../../entities/response/logged_user_cart/user_cart_response.dart';
import '../../repositories/item_cart/delete_update_item_cart_repository.dart';

@injectable
class DeleteItemCartUseCase {
  DeleteUpdateItemCartRepository deleteUpdateItemCartRepository;
  DeleteItemCartUseCase(this.deleteUpdateItemCartRepository);
  Future<UserCartResponse> invoke(String productId) {
    return deleteUpdateItemCartRepository.deleteItemCart(productId);
  }
}
