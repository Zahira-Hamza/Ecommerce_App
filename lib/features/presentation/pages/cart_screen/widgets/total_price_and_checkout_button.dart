// import 'package:e_commerce_app/core/utils/app_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../widgets/custom_elevated_button.dart';
//
// class TotalPriceAndCheckoutButton extends StatelessWidget {
//   const TotalPriceAndCheckoutButton({
//     required this.totalPrice,
//     required this.checkoutButtonOnTap,
//   });
//
//   final int totalPrice;
//   final void Function() checkoutButtonOnTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Total price',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: AppStyles.medium14Text.copyWith(
//                   color: AppColors.text.withOpacity(0.6), fontSize: 18.sp),
//             ),
//             SizedBox(height: 4.h),
//             SizedBox(
//               width: 90.w,
//               child: Text(
//                 'EGP $totalPrice',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: AppStyles.medium14Text.copyWith(fontSize: 18.sp),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 18.h),
//         Expanded(
//           child: CustomElevatedButton(
//             label: 'Check Out',
//             onTap: checkoutButtonOnTap,
//             suffixIcon: const Icon(
//               Icons.arrow_forward,
//               color: AppColors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/custom_elevated_button.dart';

class TotalPriceAndCheckoutButton extends StatelessWidget {
  const TotalPriceAndCheckoutButton({
    super.key,
    required this.totalPrice,
    required this.checkoutButtonOnTap,
  });

  final int totalPrice;
  final void Function() checkoutButtonOnTap;

  // Simple formatter for large numbers (e.g., 1250 -> '1,250')
  String _formatPrice(int price) {
    if (price < 1000) return price.toString();
    final thousands = (price / 1000).floor();
    final remainder = (price % 1000).toString().padLeft(3, '0');
    return '$thousands,$remainder';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              maxLines: 1,
              style: AppStyles.medium14Text.copyWith(
                  color: AppColors.text.withOpacity(0.6), fontSize: 18.sp),
            ),
            SizedBox(height: 4.h),
            // Removed SizedBox(width: 90.w) and overflow: ellipsis
            Text(
              'EGP ${_formatPrice(totalPrice)}', // Formatted without ellipsis
              maxLines: 1, // No overflow needed now
              style: AppStyles.medium14Text.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
        SizedBox(width: 18.h),
        Expanded(
          child: CustomElevatedButton(
            label: 'Check Out',
            onTap: checkoutButtonOnTap,
            suffixIcon: const Icon(
              Icons.arrow_forward,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
