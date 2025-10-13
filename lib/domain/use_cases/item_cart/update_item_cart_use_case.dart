import 'package:injectable/injectable.dart';

import '../../entities/response/logged_user_cart/user_cart_response.dart';
import '../../repositories/item_cart/delete_update_item_cart_repository.dart';

@injectable
class UpdateItemCartUseCase {
  DeleteUpdateItemCartRepository deleteUpdateItemCartRepository;
  UpdateItemCartUseCase(this.deleteUpdateItemCartRepository);
  Future<UserCartResponse> invoke(String productId, int itemCount) {
    return deleteUpdateItemCartRepository.updateItemCountCart(
        productId, itemCount);
  }
}
