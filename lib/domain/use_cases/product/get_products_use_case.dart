import 'package:e_commerce_app/domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/common/product.dart';

@injectable
class GetProductsUseCase {
  ProductRepository productRepository;
  GetProductsUseCase({required this.productRepository});
  Future<List<Product>?> invoke() async {
    try {
      print('🔄 GetProductsUseCase: Calling repository...');
      var result = await productRepository.getProducts();
      print('✅ GetProductsUseCase: Repository call completed');
      return result;
    } catch (e) {
      print('❌ GetProductsUseCase: Error - $e');
      rethrow;
    }
  }
}
