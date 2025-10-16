import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_colors.dart';
import 'custom_auto_size_text.dart';

class WishlistItemDetails extends StatelessWidget {
  const WishlistItemDetails({required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomAutoSizeText(
          data: product['title'],
          textStyle: AppStyles.semiBold18primaryDark,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10.w),
              width: 14.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: product['color'],
                shape: BoxShape.circle,
              ),
            ),
            //! CustomAutoSizeText(
            //!   data: (product['color'] as Color).colorName,
            //!   textStyle: AppStyles.medium18darkPrimary.copyWith(fontSize: 14),
            //! ),
          ],
        ),
        Row(
          children: [
            CustomAutoSizeText(
              data: 'EGP ${product['finalPrice']}  ',
              //semibold-18-primary dark
              textStyle: AppStyles.semiBold18primaryDark.copyWith(
                letterSpacing: 0.17,
              ),
            ),
            product['salePrice'] == null
                ? const SizedBox.shrink()
                : Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomAutoSizeText(
                          data: 'EGP ${product['salePrice']}',
                          textStyle: AppStyles.medium18appBarTitle.copyWith(
                            letterSpacing: 0.17,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.appBarTitle.withOpacity(.6),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
