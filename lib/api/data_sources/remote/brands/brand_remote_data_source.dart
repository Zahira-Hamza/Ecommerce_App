import '../../../../domain/entities/common/brand.dart';

abstract class BrandRemoteDataSource {
  Future<List<Brand>?> getBrands();
}
