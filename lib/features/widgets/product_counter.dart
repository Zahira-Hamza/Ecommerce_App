import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class ProductCounter extends StatefulWidget {
  final int initialValue;
  final void Function(int) onIncrement;
  final void Function(int) onDecrement;

  const ProductCounter({
    required this.onIncrement,
    required this.onDecrement,
    required this.initialValue,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  late int _counter = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (_counter == 1) return;
              setState(() => _counter--);
              widget.onDecrement(_counter);
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 20.w,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Text(
            '$_counter',
            style: AppStyles.medium18white,
          ),
          SizedBox(
            width: 18.w,
          ),
          InkWell(
            onTap: () {
              setState(() => _counter++);
              widget.onIncrement(_counter);
            },
            child: Icon(
              Icons.add_circle_outline,
              color: AppColors.white,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
