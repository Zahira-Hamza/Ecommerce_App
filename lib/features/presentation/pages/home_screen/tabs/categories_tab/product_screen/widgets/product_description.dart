import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../../../core/utils/app_colors.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description',
            style: AppStyles.medium18appBarTitle.copyWith(fontSize: 20.sp)),
        SizedBox(
          height: 8.h,
        ),
        ReadMoreText(
          description,
          style: AppStyles.medium18appBarTitle.copyWith(
              color: AppColors.appBarTitle.withOpacity(.6), fontSize: 14.sp),
          trimExpandedText: ' Read Less',
          trimCollapsedText: ' Read More',
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: AppColors.primary,
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
