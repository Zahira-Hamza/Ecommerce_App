import 'package:e_commerce_app/api/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/common/product.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/product/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<List<Product>?> getProducts() {
    // TODO: implement getProducts
    return productRemoteDataSource.getProducts();
  }
}
