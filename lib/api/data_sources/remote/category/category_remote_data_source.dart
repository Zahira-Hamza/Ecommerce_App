import '../../../../domain/entities/common/category.dart';

//! note that we only use the dto models in the implementation
abstract class CategoryRemoteDataSource {
  Future<List<Category>?> getCategories();
}
