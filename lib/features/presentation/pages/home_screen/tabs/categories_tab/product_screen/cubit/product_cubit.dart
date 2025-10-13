import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../domain/entities/common/product.dart';
import '../../../../../../../../domain/use_cases/product/get_products_use_case.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  GetProductsUseCase getProductsUseCase;
  ProductCubit({required this.getProductsUseCase}) : super(ProductLoading());
  void getProducts() async {
    try {
      print('🔄 ProductCubit: Loading started...');
      emit(ProductLoading());
      var productsList = await getProductsUseCase.invoke();
      print(
          '✅ ProductCubit: Products loaded - ${productsList?.length ?? 0} items');
      emit(ProductLoaded(productsList: productsList));
    } on AppException catch (e) {
      emit(ProductError(message: e.message));
    } catch (e, s) {
      print('❌ ProductCubit: Unexpected error - $e');
      print('Stack trace: $s');
      emit(ProductError(message: 'Unexpected error: $e'));
    }
  }
}
