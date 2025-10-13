import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/models/response/add_product_to_cart/add_product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../domain/entities/request/update_item_count_request/update_item_count_request.dart';
import 'api_endpoints.dart';
import 'models/request/add_product_to_cart/add_product_request_dto.dart';
import 'models/request/auth/signin_request_dto.dart';
import 'models/request/auth/signup_request_dto.dart';
import 'models/response/auth/auth_response_dto.dart';
import 'models/response/brands/brands_response_dto.dart';
import 'models/response/category/category_response_dto.dart';
import 'models/response/logged_user_cart/user_cart_response_dto.dart';
import 'models/response/products/products_response_dto.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndpoints.signin)
  Future<AuthResponseDto> signIn(@Body() SigninRequestDto signinRequest);

  @POST(ApiEndpoints.signup)
  Future<AuthResponseDto> signUp(@Body() SignupRequestDto signupRequest);

  @GET(ApiEndpoints.categoriesApi)
  Future<CategoryResponseDto> getCategories();

  @GET(ApiEndpoints.brandsApi)
  Future<BrandsResponseDto> getBrands();

  @GET(ApiEndpoints.productsApi)
  Future<ProductsResponseDto> getProducts();

  @GET(ApiEndpoints.add_user_cartApi)
  Future<UserCartResponseDto> getUserCart(@Header("token") String token);

  @POST(ApiEndpoints.add_productApi)
  Future<AddProductResponseDto> addProductToCart(
      @Body() AddProductRequestDto addProductRequest,
      @Header("token") String token);

  @DELETE(ApiEndpoints.delete_item_cartApi)
  Future<UserCartResponseDto> deleteItemCart(
      @Path("productId") String productId, @Header("token") String token);

  @PUT(ApiEndpoints.update_item_count_cartApi)
  Future<UserCartResponseDto> updateItemCountCart(
      @Path("productId") String productId,
      @Header("token") String token,
      @Body() UpdateItemCountRequestDto updateItemCountRequest);
}
