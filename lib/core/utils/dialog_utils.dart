import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String loadingText}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              backgroundColor: AppColors.containerGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r), // شكل الحواف
              ),
              content: Row(
                children: [
                  CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    loadingText,
                    style: AppStyles.semiBold16blue,
                  ),
                ],
              ),
            ));
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showMessage({
    bool barrierDismissible = true,
    required BuildContext context,
    required String message,
    String? title,
    String? postActionName,
    Function? onPostActionPressed,
    String? negActionName,
    Function? onNegActionPressed,
  }) {
    List<Widget> actions = [];

    if (postActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onPostActionPressed != null) {
                onPostActionPressed.call();
              }
            },
            child: Text(postActionName, style: AppStyles.semiBold16blue)),
      );
    }

    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onNegActionPressed != null) {
              onNegActionPressed.call();
            }
          },
          child: Text(
            negActionName,
            style: AppStyles.semiBold16blue,
          )));
    }

    // ✅ هنا لازم تفتح الـ Dialog
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.containerGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r), // شكل الحواف
        ),
        title: Text(title ?? "", style: AppStyles.semiBold16blue),
        content: Text(
          message,
          style: AppStyles.semiBold16blue,
        ),
        actions: actions,
      ),
    );
  }
}
