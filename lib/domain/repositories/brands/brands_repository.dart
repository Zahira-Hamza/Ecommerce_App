import 'package:e_commerce_app/domain/entities/common/brand.dart';

abstract class BrandsRepository {
  Future<List<Brand>?> getBrands();
}
