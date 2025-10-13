import 'package:e_commerce_app/domain/entities/common/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getProducts();
}
