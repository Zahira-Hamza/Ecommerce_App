import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../domain/entities/common/brand.dart';
import '../../../../../../../domain/entities/common/category.dart';
import '../../../../../../../domain/use_cases/brands/get_brands_use_case.dart';
import '../../../../../../../domain/use_cases/category/get_categories_use_case.dart';

part 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  HomeTabLoaded homeTabLoaded = HomeTabLoaded();
  HomeTabCubit(
      {required this.getCategoriesUseCase, required this.getBrandsUseCase})
      : super(HomeTabInitial());
  //** hold data-handle logic-emit state
  final List<String> announcementsImagesPaths = [
    AppAssets.carouselSlider1,
    AppAssets.carouselSlider2,
    AppAssets.carouselSlider3,
  ];
  void getCategories() async {
    try {
      emit(CategoryLoading());
      List<Category> categoriesList = await getCategoriesUseCase.invoke();
      // Emit HomeTabLoaded with updated categories
      emit(homeTabLoaded =
          homeTabLoaded.copyWith(categoriesList: categoriesList));
    } on AppException catch (e) {
      emit(CategoryError(Message: e.message));
    }
  }

  void getBrands() async {
    try {
      emit(BrandLoading());
      List<Brand> brandsList = await getBrandsUseCase.invoke();
      // Emit HomeTabLoaded with updated brands
      emit(homeTabLoaded = homeTabLoaded.copyWith(brandsList: brandsList));
    } on AppException catch (e) {
      emit(BrandError(Message: e.message));
    }
  }
}
