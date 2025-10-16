import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../domain/entities/common/product.dart';
import '../../../../../../../../domain/use_cases/product/get_products_use_case.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];

  ProductCubit({required this.getProductsUseCase}) : super(ProductLoading());

  Future<void> getProducts() async {
    try {
      emit(ProductLoading());
      final productsList = await getProductsUseCase.invoke();
      _allProducts = productsList ?? [];
      _filteredProducts = _allProducts;
      emit(ProductLoaded(productsList: _filteredProducts));
    } on AppException catch (e) {
      emit(ProductError(message: e.message));
    } catch (e, s) {
      print('❌ ProductCubit Error: $e');
      print(s);
      emit(ProductError(message: 'Unexpected error: $e'));
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts
          .where((p) =>
              (p.title?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
              (p.description?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
    emit(ProductLoaded(productsList: _filteredProducts));
  }
}
