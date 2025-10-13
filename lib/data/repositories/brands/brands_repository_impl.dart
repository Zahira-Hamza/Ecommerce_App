import 'package:e_commerce_app/api/data_sources/remote/brands/brand_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/common/brand.dart';
import 'package:e_commerce_app/domain/repositories/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository {
  BrandRemoteDataSource brandDataSource;
  BrandsRepositoryImpl(this.brandDataSource);
  @override
  Future<List<Brand>?> getBrands() {
    // TODO: implement getBrands
    return brandDataSource.getBrands();
  }
}
