import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerce_app/api/mapper/product/productMapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/domain/entities/common/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  WebServices productWebServices;
  ProductRemoteDataSourceImpl({required this.productWebServices});
  @override
  Future<List<Product>?> getProducts() async {
    try {
      // TODO: implement getProducts
      var productResponse = await productWebServices.getProducts();
      //* productDto=>product
      return productResponse.data
          ?.map((productDto) => productDto.toProduct())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
