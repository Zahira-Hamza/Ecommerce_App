// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/data_sources/remote/auth/auth_remote_data_source.dart'
    as _i757;
import '../../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i989;
import '../../api/data_sources/remote/brands/brand_remote_data_source.dart'
    as _i158;
import '../../api/data_sources/remote/brands/brand_remote_data_source_impl.dart'
    as _i251;
import '../../api/data_sources/remote/cart/cart_remote_data_source.dart'
    as _i184;
import '../../api/data_sources/remote/cart/cart_remote_data_source_impl.dart'
    as _i1062;
import '../../api/data_sources/remote/category/category_remote_data_source.dart'
    as _i548;
import '../../api/data_sources/remote/category/category_remote_data_source_impl.dart'
    as _i572;
import '../../api/data_sources/remote/item_cart/delete_update_item_cart_remote_ds.dart'
    as _i976;
import '../../api/data_sources/remote/item_cart/delete_update_item_cart_remote_ds_impl.dart'
    as _i137;
import '../../api/data_sources/remote/product/product_remote_data_source.dart'
    as _i506;
import '../../api/data_sources/remote/product/product_remote_data_source_impl.dart'
    as _i122;
import '../../api/dio/dio_module.dart' as _i67;
import '../../api/web_services.dart' as _i1069;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/brands/brands_repository_impl.dart' as _i1035;
import '../../data/repositories/cart/cart_repository_impl.dart' as _i959;
import '../../data/repositories/category/category_repository_impl.dart'
    as _i702;
import '../../data/repositories/item_cart/delete_update_item_cart_repository_impl.dart'
    as _i837;
import '../../data/repositories/product/product_repository_impl.dart' as _i322;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/brands/brands_repository.dart' as _i871;
import '../../domain/repositories/cart/cart_repository.dart' as _i388;
import '../../domain/repositories/category/category_repository.dart' as _i612;
import '../../domain/repositories/item_cart/delete_update_item_cart_repository.dart'
    as _i815;
import '../../domain/repositories/product/product_repository.dart' as _i774;
import '../../domain/use_cases/auth/signin_use_case.dart' as _i549;
import '../../domain/use_cases/auth/signup_use_case.dart' as _i86;
import '../../domain/use_cases/brands/get_brands_use_case.dart' as _i755;
import '../../domain/use_cases/cart/add_product_to_cart_use_case.dart' as _i504;
import '../../domain/use_cases/cart/get_user_cart_use_case.dart' as _i535;
import '../../domain/use_cases/category/get_categories_use_case.dart' as _i665;
import '../../domain/use_cases/item_cart/delete_item_cart_use_case.dart'
    as _i980;
import '../../domain/use_cases/item_cart/update_item_cart_use_case.dart'
    as _i779;
import '../../domain/use_cases/product/get_products_use_case.dart' as _i485;
import '../../features/presentation/auth/cubit/signin_cubit.dart' as _i129;
import '../../features/presentation/auth/cubit/signup_cubit.dart' as _i54;
import '../../features/presentation/pages/cart_screen/cubit/cart_cubit.dart'
    as _i719;
import '../../features/presentation/pages/home_screen/cubit/home_screen_cubit.dart'
    as _i830;
import '../../features/presentation/pages/home_screen/tabs/categories_tab/product_screen/cubit/product_cubit.dart'
    as _i647;
import '../../features/presentation/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart'
    as _i813;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItModule = _$GetItModule();
    gh.factory<_i830.HomeScreenCubit>(() => _i830.HomeScreenCubit());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(() => getItModule.provideLogger());
    gh.singleton<_i361.Dio>(() => getItModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.singleton<_i1069.WebServices>(
        () => getItModule.provideWebServices(gh<_i361.Dio>()));
    gh.factory<_i506.ProductRemoteDataSource>(() =>
        _i122.ProductRemoteDataSourceImpl(
            productWebServices: gh<_i1069.WebServices>()));
    gh.factory<_i976.DeleteUpdateItemCartRemoteDs>(
        () => _i137.DeleteUpdateItemCartRemoteDsImpl(gh<_i1069.WebServices>()));
    gh.factory<_i757.AuthRemoteDataSource>(() =>
        _i989.AuthRemoteDataSourceImpl(webServices: gh<_i1069.WebServices>()));
    gh.factory<_i815.DeleteUpdateItemCartRepository>(() =>
        _i837.DeleteUpdateItemCartRepositoryImpl(
            gh<_i976.DeleteUpdateItemCartRemoteDs>()));
    gh.factory<_i660.AuthRepository>(() => _i24.AuthRepositoryImpl(
        remoteDataSource: gh<_i757.AuthRemoteDataSource>()));
    gh.factory<_i980.DeleteItemCartUseCase>(() => _i980.DeleteItemCartUseCase(
        gh<_i815.DeleteUpdateItemCartRepository>()));
    gh.factory<_i779.UpdateItemCartUseCase>(() => _i779.UpdateItemCartUseCase(
        gh<_i815.DeleteUpdateItemCartRepository>()));
    gh.factory<_i158.BrandRemoteDataSource>(
        () => _i251.BrandDataSourceImpl(gh<_i1069.WebServices>()));
    gh.factory<_i548.CategoryRemoteDataSource>(
        () => _i572.CategoryRemoteDataSourceImpl(gh<_i1069.WebServices>()));
    gh.factory<_i184.CartRemoteDataSource>(() =>
        _i1062.CartRemoteDataSourceImpl(
            cartWebServices: gh<_i1069.WebServices>()));
    gh.factory<_i774.ProductRepository>(() => _i322.ProductRepositoryImpl(
        productRemoteDataSource: gh<_i506.ProductRemoteDataSource>()));
    gh.factory<_i871.BrandsRepository>(
        () => _i1035.BrandsRepositoryImpl(gh<_i158.BrandRemoteDataSource>()));
    gh.factory<_i612.CategoryRepository>(() =>
        _i702.CategoryRepositoryImpl(gh<_i548.CategoryRemoteDataSource>()));
    gh.factory<_i485.GetProductsUseCase>(() => _i485.GetProductsUseCase(
        productRepository: gh<_i774.ProductRepository>()));
    gh.factory<_i388.CartRepository>(() => _i959.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i184.CartRemoteDataSource>()));
    gh.factory<_i665.GetCategoriesUseCase>(
        () => _i665.GetCategoriesUseCase(gh<_i612.CategoryRepository>()));
    gh.factory<_i549.SigninUseCase>(
        () => _i549.SigninUseCase(authRepository: gh<_i660.AuthRepository>()));
    gh.factory<_i86.SignupUseCase>(
        () => _i86.SignupUseCase(authRepository: gh<_i660.AuthRepository>()));
    gh.factory<_i129.SigninCubit>(
        () => _i129.SigninCubit(signinUseCase: gh<_i549.SigninUseCase>()));
    gh.factory<_i647.ProductCubit>(() =>
        _i647.ProductCubit(getProductsUseCase: gh<_i485.GetProductsUseCase>()));
    gh.factory<_i755.GetBrandsUseCase>(
        () => _i755.GetBrandsUseCase(gh<_i871.BrandsRepository>()));
    gh.factory<_i535.GetUserCartUseCase>(() =>
        _i535.GetUserCartUseCase(cartRepository: gh<_i388.CartRepository>()));
    gh.factory<_i54.SignupCubit>(
        () => _i54.SignupCubit(signupUseCase: gh<_i86.SignupUseCase>()));
    gh.factory<_i504.AddProductToCartUseCase>(
        () => _i504.AddProductToCartUseCase(gh<_i388.CartRepository>()));
    gh.factory<_i813.HomeTabCubit>(() => _i813.HomeTabCubit(
          getCategoriesUseCase: gh<_i665.GetCategoriesUseCase>(),
          getBrandsUseCase: gh<_i755.GetBrandsUseCase>(),
        ));
    gh.factory<_i719.CartCubit>(() => _i719.CartCubit(
          addProductToCartUseCase: gh<_i504.AddProductToCartUseCase>(),
          getUserCartUseCase: gh<_i535.GetUserCartUseCase>(),
          updateItemCartUseCase: gh<_i779.UpdateItemCartUseCase>(),
          deleteItemCartUseCase: gh<_i980.DeleteItemCartUseCase>(),
        ));
    return this;
  }
}

class _$GetItModule extends _i67.GetItModule {}
