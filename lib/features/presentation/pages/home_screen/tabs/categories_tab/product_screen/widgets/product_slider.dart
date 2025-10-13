import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../../../core/utils/app_colors.dart';

class ProductSlider extends StatefulWidget {
  final List<Widget> items;
  final int initialIndex;

  const ProductSlider({
    required this.items,
    required this.initialIndex,
  });

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  late PageController _pageController;
  late int _currentIndex = widget.initialIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView to display the images - REMOVED FIXED HEIGHT
        Container(
          height: 300.h, // Increased height to accommodate the images
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: widget.items[index],
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        // Indicator
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.items.length,
          duration: const Duration(milliseconds: 300),
          effect: ExpandingDotsEffect(
            dotWidth: 8.w,
            dotHeight: 8.h,
            dotColor: Colors.grey.shade300,
            activeDotColor: AppColors.primary,
            spacing: 4.w,
          ),
        ),
      ],
    );
  }
}
