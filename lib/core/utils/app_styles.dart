import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  //*static TextStyle font_name(FONTSIZE+FONTweight+fontColor)=GoogleFonts.fontType();
  static final TextStyle semiBold24white = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final TextStyle semiBold20blue = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final TextStyle semiBold18primary = GoogleFonts.poppins(
    color: AppColors.primary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle semiBold16blue = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static final TextStyle semiBold18primaryDark = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
  static final TextStyle Bold18Text = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static final TextStyle light16lightWhite = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white70,
  );
  static final TextStyle medium18white = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static final TextStyle medium18primary = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static final TextStyle medium18darkPrimary = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkPrimary,
  );
  static final TextStyle medium18darkBlue = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlue,
  );
  static final TextStyle medium18appBarTitle = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTitle,
  );
  static final TextStyle regular18white = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle regular12darkBlue = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkBlue,
  );
  static final TextStyle regular14darkBlue = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkBlue,
  );
  static final TextStyle regular14Text = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static final TextStyle regular14primary = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static final TextStyle regular14white = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final TextStyle regular16primary = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static final TextStyle regular12Text = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static final TextStyle medium14Text = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static final TextStyle regular18grey = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static final TextStyle light18dark = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w300,
    color: Colors.black54,
  );
  static final TextStyle bold16white = GoogleFonts.poppins();
}
