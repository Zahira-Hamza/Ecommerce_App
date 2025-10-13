import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce_app/api/mapper/category/categoryMapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/domain/entities/common/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  WebServices categoryWebServices;
  CategoryRemoteDataSourceImpl(this.categoryWebServices);
  @override
  Future<List<Category>?> getCategories() async {
    try {
      var categoryResponse = await categoryWebServices.getCategories();
      //todo:CategoryDto=>Category
      //! categoryResponse returning a list of categoryDto and we need to convert it to list of category so we use map
      return categoryResponse.data
              ?.map((categoryDto) => categoryDto.toCategory())
              .toList() ??
          [];
    } on DioException catch (e) {
      //! turning(casting) the dioException object into appException
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
