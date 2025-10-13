import 'package:e_commerce_app/api/data_sources/remote/item_cart/delete_update_item_cart_remote_ds.dart';
import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/item_cart/delete_update_item_cart_repository.dart';

@Injectable(as: DeleteUpdateItemCartRepository)
class DeleteUpdateItemCartRepositoryImpl
    implements DeleteUpdateItemCartRepository {
  DeleteUpdateItemCartRemoteDs deleteUpdateItemCartRemoteDs;
  DeleteUpdateItemCartRepositoryImpl(this.deleteUpdateItemCartRemoteDs);
  @override
  Future<UserCartResponse> deleteItemCart(String productId) {
    return deleteUpdateItemCartRemoteDs.deleteItemCart(productId);
  }

  @override
  Future<UserCartResponse> updateItemCountCart(
      String productId, int itemCount) {
    return deleteUpdateItemCartRemoteDs.updateItemCountCart(
        productId, itemCount);
  }
}
