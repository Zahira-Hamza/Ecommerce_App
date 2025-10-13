import 'package:e_commerce_app/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final CategoryRepository categoryRepository;
  GetCategoriesUseCase(this.categoryRepository);
  invoke() {
    return categoryRepository.getCategories();
  }
}
