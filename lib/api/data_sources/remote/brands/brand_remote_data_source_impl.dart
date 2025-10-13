import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/mapper/brands/brandMapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/domain/entities/common/brand.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import 'brand_remote_data_source.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandDataSourceImpl implements BrandRemoteDataSource {
  WebServices brandWebServices;
  BrandDataSourceImpl(this.brandWebServices);

  @override
  Future<List<Brand>?> getBrands() async {
    try {
      // TODO: implement getBrands
      var brandResponse = await brandWebServices.getBrands();
      //* BrandDto=>Brand
      return brandResponse.data
              ?.map((brandDto) => brandDto.toBrand())
              .toList() ??
          [];
    } on DioException catch (e) {
      //! turning(casting) the dioException object into appException
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
