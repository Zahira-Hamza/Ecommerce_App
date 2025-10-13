import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ColorAndSizeCartItem extends StatelessWidget {
  const ColorAndSizeCartItem({
    required this.color,
    required this.colorName,
    required this.size,
  });

  final Color color;
  final String colorName;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7.5.r,
          backgroundColor: color,
        ),
        SizedBox(width: 5.w),
        Text(
          colorName,
          style: AppStyles.regular14Text
              .copyWith(color: AppColors.text.withOpacity(0.5)),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 2.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: AppColors.grey1,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          'Size: $size',
          style: AppStyles.regular14Text
              .copyWith(color: AppColors.text.withOpacity(0.5)),
        ),
      ],
    );
  }
}
