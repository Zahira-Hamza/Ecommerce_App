import 'package:e_commerce_app/core/cashe/shared_pref_utils.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab();

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool _isFullNameReadOnly = true;
  bool _isEmailReadOnly = true;
  bool _isPasswordReadOnly = true;
  bool _isPhoneReadOnly = true;
  bool _isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.spl,
                height: 35.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Welcome, Mohamed',
                    style: AppStyles.semiBold18primary,
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        //todo:remove the token
                        SharedPrefUtils.removeData(key: "token");
                        //todo:navigate to login screen
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.loginRoute, (route) => false);
                      },
                      child:
                          Icon(Icons.login_rounded, color: AppColors.primary)),
                ],
              ),
              Text('mohamed.N@gmail.com',
                  style: AppStyles.regular14primary.copyWith(
                    color: AppColors.primary.withOpacity(.5),
                  )),
              SizedBox(height: 18.h),
              CustomTextField(
                borderBackgroundColor: AppColors.primary.withOpacity(.5),
                readOnly: _isFullNameReadOnly,
                backgroundColor: AppColors.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller:
                    TextEditingController(text: 'Mohamed Mohamed Nabil'),
                labelTextStyle: AppStyles.medium18primary,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.edit,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => setState(() => _isFullNameReadOnly = false),
                ),
                textInputType: TextInputType.text,
                validation: Validators.validateFullName,
                hintTextStyle:
                    AppStyles.regular14primary.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                borderBackgroundColor: AppColors.primary.withOpacity(.5),
                readOnly: _isEmailReadOnly,
                backgroundColor: AppColors.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: 'mohamed.N@gmail.com'),
                labelTextStyle: AppStyles.medium18primary,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.edit,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => setState(() => _isEmailReadOnly = false),
                ),
                textInputType: TextInputType.emailAddress,
                validation: Validators.validateEmail,
                hintTextStyle:
                    AppStyles.regular14primary.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                onTap: () => setState(() => _isPasswordReadOnly = false),
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: AppColors.primary.withOpacity(.5),
                readOnly: _isPasswordReadOnly,
                backgroundColor: AppColors.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: AppStyles.medium18primary,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.edit,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => setState(() => _isPasswordReadOnly = false),
                ),
                textInputType: TextInputType.text,
                validation: Validators.validatePassword,
                hintTextStyle:
                    AppStyles.regular14primary.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                controller: TextEditingController(text: '01122118855'),
                borderBackgroundColor: AppColors.primary.withOpacity(.5),
                readOnly: _isPhoneReadOnly,
                backgroundColor: AppColors.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: AppStyles.medium18primary,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.edit,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => setState(() => _isPhoneReadOnly = false),
                ),
                textInputType: TextInputType.phone,
                validation: Validators.validatePhoneNumber,
                hintTextStyle:
                    AppStyles.regular14primary.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                controller:
                    TextEditingController(text: '6th October, street 11.....'),
                borderBackgroundColor: AppColors.primary.withOpacity(.5),
                readOnly: _isAddressReadOnly,
                backgroundColor: AppColors.white,
                hint: '6th October, street 11.....',
                label: 'Your Address',
                labelTextStyle: AppStyles.medium18primary,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.edit,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => setState(() => _isAddressReadOnly = false),
                ),
                textInputType: TextInputType.streetAddress,
                validation: Validators.validateFullName,
                hintTextStyle:
                    AppStyles.regular14primary.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
