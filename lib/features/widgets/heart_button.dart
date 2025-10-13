import 'package:flutter/material.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;

  const HeartButton({required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = AppAssets.heart;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => setState(() {
        isClicked = !isClicked;
        heartIcon = !isClicked ? AppAssets.heart : AppAssets.clickedHeart;
        widget.onTap?.call();
      }),
      child: Material(
        color: AppColors.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ImageIcon(
            AssetImage(heartIcon),
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
