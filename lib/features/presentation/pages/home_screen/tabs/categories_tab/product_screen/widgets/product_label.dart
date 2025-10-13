import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_colors.dart';

class ProductLabel extends StatelessWidget {
  const ProductLabel({
    required this.name,
    required this.price,
  });

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: AppStyles.medium18primary.copyWith(color: AppColors.black),
          ),
        ),
        Text(
          price,
          style: AppStyles.medium18primary.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
