import 'package:e_commerce_app/features/presentation/pages/cart_screen/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/home_screen_app_bar.dart';
import '../cubit/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenCubit viewModel = getIt<HomeScreenCubit>();
  @override
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getUserCart();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          body:
              viewModel.tabs[viewModel.currentIndex], // 2. Display current tab
          bottomNavigationBar: _buildBottomNavBar(), // 3. Add navigation
        );
      },
    );
  }

  //* 4. Build bottom navigation bar
  Widget _buildBottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.changeTab, // 5. Handle tab changes
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white, // Active tab color
        unselectedItemColor: AppColors.white.withOpacity(0.6),
        showSelectedLabels: false, // Consider showing labels
        showUnselectedLabels: false,
        items: [
          //* 6. Define navigation items
          _buildNavItem(AppAssets.home, 'Home'),
          _buildNavItem(AppAssets.category, 'Categories'),
          _buildNavItem(
              AppAssets.favourite, 'Wishlist'), // Use appropriate asset
          _buildNavItem(AppAssets.profile, 'Profile'),
        ],
      ),
    );
  }

  //* 8. Helper method for navigation items
  BottomNavigationBarItem _buildNavItem(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(iconPath),
        color: AppColors.white.withOpacity(0.6),
      ),
      activeIcon: CircleAvatar(
        radius: 20.r,
        backgroundColor: AppColors.white,
        child: ImageIcon(
          AssetImage(iconPath),
          color: AppColors.primary,
          size: 25.sp,
        ),
      ),
      label: label,
    );
  }
}
