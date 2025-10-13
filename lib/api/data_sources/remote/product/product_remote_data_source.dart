import '../../../../domain/entities/common/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>?> getProducts();
}
