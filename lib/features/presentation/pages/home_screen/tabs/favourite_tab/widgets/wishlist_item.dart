import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/favourite_tab/widgets/wishlist_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_routes.dart';
import '../../../../../../widgets/heart_button.dart';
import 'add_to_cart_button.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.productDetailsRoute,
        arguments: product,
      ),
      child: Container(
        height: 135.h,
        padding: EdgeInsetsDirectional.only(end: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary.withOpacity(.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.primary.withOpacity(.6)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  width: 120.w,
                  height: 135.h,
                  fit: BoxFit.cover,
                  imageUrl: product['imageUrl'],
                  placeholder: (_, __) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.error,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w),
                child: WishlistItemDetails(
                  product: product,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  onTap: () {},
                ),
                SizedBox(height: 14.h),
                AddToCartButton(
                  onPressed: () {},
                  text: 'Add to Cart',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
