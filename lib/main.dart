import 'dart:async';

import 'package:e_commerce_app/features/presentation/pages/cart_screen/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/di.dart';
import 'config/my_bloc_observer.dart';
import 'core/cashe/shared_pref_utils.dart';
import 'core/utils/app_routes.dart';
import 'features/presentation/auth/login/login_screen.dart';
import 'features/presentation/auth/register/register_screen.dart';
import 'features/presentation/pages/cart_screen/cart_screen.dart';
import 'features/presentation/pages/home_screen/home_screen.dart';
import 'features/presentation/pages/home_screen/tabs/categories_tab/product_screen/product_details_screen.dart';
import 'features/presentation/pages/home_screen/tabs/categories_tab/product_screen/product_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  //! the func we did in the shared_pref_utils file to get an object
  await SharedPrefUtils.init();
  //!============ the auto login======== !//
  String routeName;
  var token = SharedPrefUtils.getData(key: "token");
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }
  //!!!! why we did use the MultiBlocProvider?
  //* there is a parameter called bloc in the bloc builder/consumer/provider when we did do the blocProvider we wouldn't use it
  //!!!! the next question why we need the bloc parameter
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<CartCubit>()),
  ], child: ECommerceApp(routeName: routeName)));
}

//! ============!=============================//
class ECommerceApp extends StatelessWidget {
  String routeName;
  ECommerceApp({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: routeName,
            routes: {
              AppRoutes.loginRoute: (context) => const LoginScreen(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
              AppRoutes.homeRoute: (context) => const HomeScreen(),
              AppRoutes.productsListRoute: (context) =>
                  const ProductListScreen(),
              AppRoutes.productDetailsRoute: (context) =>
                  const ProductDetails(),
              AppRoutes.cartRoute: (context) => const CartScreen(),
            },
          );
        });
  }
}
