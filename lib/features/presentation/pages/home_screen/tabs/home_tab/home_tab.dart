import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/home_tab/widgets/brand_item.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/home_tab/widgets/category_item.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/home_tab/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/di/di.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../domain/entities/common/brand.dart';
import '../../../../../../domain/entities/common/category.dart';
import '../../../../../widgets/main_error_widget.dart';
import '../../../../../widgets/main_loading_widget.dart';
import 'cubit/home_tab_cubit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabCubit viewModel = getIt<HomeTabCubit>();
  //!why we did the initState for the callback fun!!!!!!!!!!!!!!
  @override
  void initState() {
    viewModel.getCategories();
    viewModel.getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: AnnouncementsSection(
                imagesPaths: viewModel.announcementsImagesPaths,
              ),
            ),
            BlocBuilder<HomeTabCubit, HomeTabState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is CategoryError) {
                  return MainErrorWidget(
                    errorMessage: state.Message,
                    onRetry: () {
                      viewModel.getCategories();
                    },
                  );
                } else if (state is HomeTabLoaded) {
                  return Column(
                    children: [
                      CustomSectionBar(
                        sectionName: 'Categories',
                        onViewAllClicked: () {},
                      ),
                      _buildCategoriesGrid(
                        state.categoriesList ?? [],
                      ),
                      SizedBox(height: 12.h),
                    ],
                  );
                } else {
                  return MainLoadingWidget();
                }
              },
            ),
            //==================bloc builder for the brands section====================
            BlocBuilder<HomeTabCubit, HomeTabState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is BrandError) {
                  return MainErrorWidget(
                    errorMessage: state.Message,
                    onRetry: () {
                      viewModel.getBrands();
                    },
                  );
                } else if (state is HomeTabLoaded) {
                  return Column(
                    children: [
                      CustomSectionBar(
                        sectionName: 'Brands',
                        onViewAllClicked: () {},
                      ),
                      _buildBrandsGrid(
                        state.brandsList ?? [],
                      ),
                      SizedBox(height: 12.h),
                    ],
                  );
                } else {
                  return MainLoadingWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(List<Category> list) {
    return SizedBox(
      height: 270.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) => CategoryItem(item: list[index]),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildBrandsGrid(List<Brand> list) {
    return SizedBox(
      height: 270.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) => BrandItem(item: list[index]),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class AnnouncementsSection extends StatelessWidget {
  final List<String> imagesPaths;

  const AnnouncementsSection({
    required this.imagesPaths,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.w), // Fixed the padding value
      child: ImageSlideshow(
        height: 210.h,
        width: double.infinity,
        initialPage: 0,
        indicatorColor: AppColors.primary,
        indicatorBackgroundColor: Colors.grey,
        indicatorRadius: 4.r,
        autoPlayInterval: 2500,
        isLoop: true,
        //* using Map here to create a list of images(Strings=>widgets)
        children: imagesPaths.map((imagePath) {
          return Image.asset(
            imagePath,
            height: 210.h,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }
}
