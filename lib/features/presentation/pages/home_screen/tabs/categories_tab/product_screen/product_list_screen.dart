import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_item.dart';
import 'package:e_commerce_app/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/di/di.dart';
import '../../../../../../../core/utils/app_routes.dart';
import '../../../../../../widgets/main_error_widget.dart';
import 'cubit/product_cubit.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen();

  @override
  State<ProductListScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductListScreen> {
  ProductCubit productViewModel = getIt<ProductCubit>();
  @override
  void initState() {
    productViewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: productViewModel,
      builder: (context, state) {
        print('🔄 BlocBuilder: Current state - ${state.runtimeType}');
        if (state is ProductLoading) {
          return MainLoadingWidget();
        } else if (state is ProductLoaded) {
          return Scaffold(
            // appBar: const HomeScreenAppBar(
            //   automaticallyImplyLeading: true,
            // ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 0.8, // CHANGED FROM 7 / 9.h to 0.65
              ),
              itemBuilder: (_, index) => InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.productDetailsRoute,
                    arguments: state.productsList![index]),
                child: ProductItem(
                  product: state.productsList![index],
                ),
              ),
              itemCount: state.productsList?.length ?? 0,
              padding: EdgeInsets.all(16.sp),
            ),
          );
        } else {
          return MainErrorWidget(errorMessage: (state as ProductError).message);
        }
      },
    );
  }
}
