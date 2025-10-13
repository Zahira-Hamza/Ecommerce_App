import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/mapper/cart/cartMapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/core/cashe/shared_pref_utils.dart';
import 'package:e_commerce_app/domain/entities/response/add_product_to_cart/add_product_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../domain/entities/response/logged_user_cart/user_cart_response.dart';
import '../../../models/request/add_product_to_cart/add_product_request_dto.dart';
import 'cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final WebServices cartWebServices;

  CartRemoteDataSourceImpl({required this.cartWebServices});

  @override
  Future<AddProductResponse> addProductToCart(String productId) async {
    try {
      //* Convert entity to DTO
      final addProductRequestDto = AddProductRequestDto(productId: productId);
      final token = SharedPrefUtils.getData(key: 'token') as String?;
//** Validate authentication tokens
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }

      //* Call web service with DTO and await the response
      final cartResponse =
          await cartWebServices.addProductToCart(addProductRequestDto, token);

      //*convert response DTO to entity
      return cartResponse.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<UserCartResponse> getUserCart() async {
    try {
      final token = SharedPrefUtils.getData(key: 'token') as String?;
      //** Validate authentication tokens
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }
      //* Call web service with DTO and await the response
      final userCartResponse = await cartWebServices.getUserCart(token);
      //*convert response DTO to entity
      return userCartResponse.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
