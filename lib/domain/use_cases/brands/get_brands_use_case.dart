import 'package:injectable/injectable.dart';

import '../../repositories/brands/brands_repository.dart';

@injectable
class GetBrandsUseCase {
  final BrandsRepository brandRepository;
  GetBrandsUseCase(this.brandRepository);
  invoke() {
    return brandRepository.getBrands();
  }
}
