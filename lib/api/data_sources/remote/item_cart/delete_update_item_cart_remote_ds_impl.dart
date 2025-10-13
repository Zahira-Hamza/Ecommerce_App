import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/mapper/cart/cartMapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cashe/shared_pref_utils.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../domain/entities/request/update_item_count_request/update_item_count_request.dart';
import 'delete_update_item_cart_remote_ds.dart';

@Injectable(as: DeleteUpdateItemCartRemoteDs)
class DeleteUpdateItemCartRemoteDsImpl implements DeleteUpdateItemCartRemoteDs {
  WebServices deleteUpdateWebServices;
  DeleteUpdateItemCartRemoteDsImpl(this.deleteUpdateWebServices);
  @override
  Future<UserCartResponse> deleteItemCart(String productId) async {
    // TODO: implement deleteItemCart
    try {
      final token = SharedPrefUtils.getData(key: 'token') as String?;
      //** Validate authentication tokens
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }
      //* Call web service with DTO and await the response
      final userCartResponse =
          await deleteUpdateWebServices.deleteItemCart(productId, token);
      //*convert response DTO to entity
      return userCartResponse.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<UserCartResponse> updateItemCountCart(
      String productId, int itemCount) async {
    // TODO: implement updateItemCountCart
    try {
      final token = SharedPrefUtils.getData(key: 'token') as String?;
      final updateItemCountRequest =
          UpdateItemCountRequestDto(count: itemCount.toString());
      //** Validate authentication tokens
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }
      //* Call web service with DTO and await the response
      final userCartResponse = await deleteUpdateWebServices
          .updateItemCountCart(productId, token, updateItemCountRequest);
      //*convert response DTO to entity
      return userCartResponse.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
