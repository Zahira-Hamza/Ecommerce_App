// import 'package:badges/badges.dart' as badges; // 1. Import badges package
// import 'package:e_commerce_app/core/utils/app_assets.dart';
// import 'package:e_commerce_app/core/utils/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../core/utils/app_colors.dart';
// import '../../core/utils/app_styles.dart';
// import '../presentation/pages/cart_screen/cubit/cart_cubit.dart';
//
// class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool? automaticallyImplyLeading;
//   // Removed unused badgeCount parameter (now handled dynamically via BlocBuilder)
//
//   const HomeScreenAppBar({
//     this.automaticallyImplyLeading,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       surfaceTintColor: Colors.white,
//       automaticallyImplyLeading: automaticallyImplyLeading ?? false,
//       title: SvgPicture.asset(
//         AppAssets.route,
//         height: 25.h,
//         width: 25.w,
//         colorFilter: const ColorFilter.mode(AppColors.text, BlendMode.srcIn),
//       ),
//       bottom: PreferredSize(
//         preferredSize: Size(100.w, 40.h), // Unchanged: Reduced height
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   cursorColor: AppColors.primary,
//                   style: AppStyles.regular16primary,
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 12.w,
//                       vertical: 8.h,
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10000),
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10000),
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10000),
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10000),
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10000),
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: AppColors.error,
//                       ),
//                     ),
//                     prefixIcon: const ImageIcon(
//                       AssetImage(AppAssets.search),
//                       color: AppColors.primary,
//                     ),
//                     hintText: 'what do you search for?',
//                     hintStyle: AppStyles.regular16primary,
//                   ),
//                 ),
//               ),
//               // 3. BlocBuilder to read from state (rebuilds on CartState changes)
//               BlocBuilder<CartCubit, CartState>(
//                 builder: (context, state) {
//                   // Extract count from state (0 if not loaded)
//                   final int cartCount = state is CartLoaded
//                       ? state.numOfCartItems
//                       : (context
//                           .read<CartCubit>()
//                           .numOfCartItems); // Fallback to Cubit field if needed
//
//                   return badges.Badge(
//                     badgeContent: Text(
//                       cartCount > 99
//                           ? '99+'
//                           : cartCount.toString(), // Optional: Cap at 99+
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10.sp,
//                         overflow: TextOverflow.ellipsis, // Handle long text
//                       ),
//                     ),
//                     badgeStyle: const badges.BadgeStyle(
//                       badgeColor: Colors.green, // Your chosen color
//                       padding: EdgeInsets.all(4), // Small padding around number
//                     ),
//                     position: badges.BadgePosition.topEnd(
//                       top: -1,
//                       end: -1,
//                     ),
//                     //  isLabelVisible: cartCount > 0, // Hide if 0 or less
//                     child: IconButton(
//                       onPressed: () =>
//                           Navigator.of(context).pushNamed(AppRoutes.cartRoute),
//                       icon: const ImageIcon(
//                         AssetImage(AppAssets.cart),
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size(0, 110.h); // Unchanged
// }
// home_screen_app_bar.dart - FIXED
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../presentation/pages/cart_screen/cubit/cart_cubit.dart';
import '../presentation/pages/home_screen/tabs/categories_tab/product_screen/cubit/product_cubit.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;

  const HomeScreenAppBar({
    this.automaticallyImplyLeading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: SvgPicture.asset(
        AppAssets.route,
        height: 25.h,
        width: 25.w,
        colorFilter: const ColorFilter.mode(AppColors.text, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
        preferredSize: Size(100.w, 40.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  style: AppStyles.regular16primary,
                  onChanged: (value) {
                    context.read<ProductCubit>().filterProducts(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.error,
                      ),
                    ),
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.search),
                      color: AppColors.primary,
                    ),
                    hintText: 'what do you search for?',
                    hintStyle: AppStyles.regular16primary,
                  ),
                ),
              ),
              // Fixed badge implementation
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  // Extract cart count from different states
                  int cartCount = 0;

                  if (state is CartLoaded) {
                    cartCount = state.numOfCartItems;
                  } else if (state is UserCartLoaded) {
                    cartCount = state.userCartResponse.numOfCartItems ?? 0;
                  } else {
                    // Fallback to cubit's internal count
                    cartCount = context.read<CartCubit>().numOfCartItems;
                  }

                  return badges.Badge(
                    badgeContent: Text(
                      cartCount > 99 ? '99+' : cartCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.green,
                      padding: EdgeInsets.all(4),
                    ),
                    position: badges.BadgePosition.topEnd(
                      top: -1,
                      end: -1,
                    ),
                    showBadge: cartCount > 0, // Only show if items exist
                    child: IconButton(
                      onPressed: () {
                        // FIXED: Remove the nullable issue by using a clear function
                        Navigator.of(context).pushNamed(AppRoutes.cartRoute);
                      },
                      icon: const ImageIcon(
                        AssetImage(AppAssets.cart),
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 110.h);
}
