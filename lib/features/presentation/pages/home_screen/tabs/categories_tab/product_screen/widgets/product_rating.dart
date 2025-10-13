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
    // FIXED: Format sold count - if more than 5000, show "5000+"
    String formattedBuyers = _formatSoldCount(buyers);

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
            '$formattedBuyers Sold',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppStyles.medium18primary
                .copyWith(fontSize: 14.sp), // Smaller font
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

  // NEW: Helper method to format sold count
  String _formatSoldCount(String buyers) {
    try {
      // Try to parse the buyers string as an integer
      int soldCount = int.tryParse(buyers) ?? 0;

      // If sold count is more than 5000, return "5000+"
      if (soldCount > 5000) {
        return '5000+';
      }

      // Otherwise return the original count as string
      return soldCount.toString();
    } catch (e) {
      // If parsing fails, return the original string
      return buyers;
    }
  }
}
