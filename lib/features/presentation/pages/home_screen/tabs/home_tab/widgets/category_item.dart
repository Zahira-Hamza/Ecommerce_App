import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../domain/entities/common/category.dart';

class CategoryItem extends StatelessWidget {
  Category item;
  CategoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).pushNamed(
      //   // Routes.products,
      // ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              //* CachedNetworkImage as the images come from the internet
              child: CachedNetworkImage(
                imageUrl: item.image ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            item.name ?? "",
            style: AppStyles.regular14darkBlue,
          ),
        ],
      ),
    );
  }
}
