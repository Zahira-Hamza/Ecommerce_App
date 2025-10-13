import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/app_colors.dart';

class ProductRating extends StatelessWidget {
  final String rating;
  final String buyers;

  const ProductRating({
    required this.rating,
    required this.buyers,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sold Count - Made more compact
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12.r), // Smaller border radius
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 8.w, vertical: 8.h), // Reduced padding
          child: Text(
            '$buyers Sold',
            overflow: TextOverflow.ellipsis,
            style: AppStyles.medium18primary
                .copyWith(fontSize: 16.sp), // Smaller font
          ),
        ),
        SizedBox(width: 10.w), // Reduced spacing

        // Rating - Made more compact
        Image.asset(
          AppAssets.rate,
          width: 25.w, // Smaller image
        ),
        SizedBox(width: 4.w),

        // Rating text - Made more compact
        Expanded(
          child: Text(
            rating,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.medium18appBarTitle
                .copyWith(fontSize: 16.sp), // Smaller font
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
