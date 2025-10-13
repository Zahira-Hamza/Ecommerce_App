import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionName;
  final VoidCallback onViewAllClicked;

  const CustomSectionBar({
    required this.sectionName,
    required this.onViewAllClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionName,
              style: AppStyles.medium18darkBlue.copyWith(fontSize: 20.sp)),
          TextButton(
            onPressed: onViewAllClicked,
            child: Text(
              'view all',
              style: AppStyles.regular12darkBlue.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
