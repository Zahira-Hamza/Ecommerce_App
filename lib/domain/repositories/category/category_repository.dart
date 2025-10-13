import '../../entities/common/category.dart';

abstract class CategoryRepository {
  Future<List<Category>?> getCategories();
}
