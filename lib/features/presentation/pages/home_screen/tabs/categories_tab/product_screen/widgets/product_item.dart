import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/presentation/pages/cart_screen/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../../core/utils/flutter_toast.dart';
import '../../../../../../../../domain/entities/common/product.dart';
import '../../../../../../../widgets/heart_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartLoaded) {
          //* Show success toast immediately
          _showToast(context, 'Product added to cart successfully!', true);
        } else if (state is CartError) {
          //* Show error toast immediately
          _showToast(context, state.message, false);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Section
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(14.r),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(14.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product?.imageCover ?? "",
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error, color: Colors.grey[500]),
                        ),
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: 4.h,
                    end: 4.w,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            // Text Section - OPTIMIZED
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title and Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _truncateTitle(product?.title ?? ""),
                          style: AppStyles.medium14Text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          _truncateDescription(product.description ?? ""),
                          style:
                              AppStyles.regular12Text.copyWith(fontSize: 12.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP${product.price ?? 0}",
                          style: AppStyles.regular12Text,
                        ),
                        Text(
                          "EGP${(product.price ?? 0) * 2}",
                          style: getTextWithLine(),
                        ),
                      ],
                    ),

                    // Rating and Add Button - COMPACT VERSION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Rating - COMPACT
                        Row(
                          children: [
                            Text(
                              'Review(${product.ratingsAverage ?? 0})',
                              style: AppStyles.regular14Text
                                  .copyWith(fontSize: 11.sp),
                            ),
                            SizedBox(width: 2.w),
                            Icon(
                              Icons.star_rate_rounded,
                              color: AppColors.starRate,
                              size: 20.w,
                            ),
                          ],
                        ),

                        // Add Button - COMPACT
                        Container(
                          height: 28.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: InkWell(
                            onTap: () {
                              // Add to cart
                              CartCubit.get(context)
                                  .addProductToCart(product.id ?? "");
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String message, bool isSuccess) {
    FlutterToast.show(
      context: context,
      message: message,
      type: isSuccess ? ToastType.success : ToastType.error,
      duration: const Duration(seconds: 2),
      position: ToastPosition.bottom,
    );
  }

  String _truncateTitle(String title) {
    final List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return '${words.sublist(0, 2).join(' ')}..';
    }
  }

  String _truncateDescription(String description) {
    final List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 3) {
      return description;
    } else {
      return '${words.sublist(0, 3).join(' ')}..';
    }
  }

  TextStyle getTextWithLine() => TextStyle(
        color: AppColors.primary,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough,
        decorationColor: AppColors.primary,
      );
}
