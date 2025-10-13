import 'package:e_commerce_app/api/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/common/category.dart';
import 'package:e_commerce_app/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl(this.categoryRemoteDataSource);
  @override
  Future<List<Category>?> getCategories() {
    // TODO: implement getCategories
    return categoryRemoteDataSource.getCategories();
  }
}
