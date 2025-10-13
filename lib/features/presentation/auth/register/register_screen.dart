import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/di/di.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../cubit/auth_state.dart';
import '../cubit/signup_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  SignupCubit signupCubit = getIt<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, AuthState>(
      bloc: signupCubit,
      listener: (context, state) {
        if (state is AuthLoading) {
          DialogUtils.showLoading(
            context: context,
            loadingText: 'Loading...',
          );
        } else if (state is AuthLoaded) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: "register successfully",
            title: "Success",
            postActionName: "OK",
            onPostActionPressed: () {
              //todo:navigate to homeScreen
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            },
          );
        } else if (state is AuthError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "Error",
            postActionName: "OK",
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SingleChildScrollView(
              child: Form(
                key: signupCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    Center(child: Image.asset(AppAssets.Route_image)),
                    SizedBox(height: 40.h),
                    Text('Create Your Account',
                        style: AppStyles.semiBold24white),
                    Text(
                      'Please fill in your details to continue',
                      style: AppStyles.light16lightWhite,
                    ),
                    SizedBox(height: 50.h),
                    CustomTextFormField(
                      backgroundColor: AppColors.white,
                      hintText: 'enter your full name',
                      labelText: 'Full Name',
                      validator: Validators.validateFullName,
                      controller: _fullNameController,
                      hintStyle: AppStyles.light16lightWhite,
                      labelStyle: AppStyles.medium18white,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 28.h),
                    CustomTextFormField(
                      backgroundColor: AppColors.white,
                      hintText: 'enter your mobile number',
                      labelText: 'Mobile Number',
                      validator: Validators.validatePhoneNumber,
                      controller: _mobileNumberController,
                      hintStyle: AppStyles.light16lightWhite,
                      labelStyle: AppStyles.medium18white,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 28.h),
                    CustomTextFormField(
                      backgroundColor: AppColors.white,
                      hintText: 'enter your email',
                      labelText: 'Email',
                      validator: Validators.validateEmail,
                      controller: _emailController,
                      hintStyle: AppStyles.light16lightWhite,
                      labelStyle: AppStyles.medium18white,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 28.h),
                    CustomTextFormField(
                      hintText: 'enter your password',
                      hintStyle: AppStyles.light16lightWhite,
                      labelStyle: AppStyles.medium18white,
                      backgroundColor: AppColors.white,
                      labelText: 'Password',
                      validator: Validators.validatePassword,
                      isObscureText: true,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    CustomTextFormField(
                      hintText: 'confirm your password',
                      hintStyle: AppStyles.light16lightWhite,
                      labelStyle: AppStyles.medium18white,
                      backgroundColor: AppColors.white,
                      labelText: 'Confirm Password',
                      validator: (value) => Validators.validateConfirmPassword(
                          value, _passwordController.text),
                      isObscureText: true,
                      controller: _rePasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Center(
                      child: SizedBox(
                        child: CustomElevatedButton(
                          label: 'Sign Up',
                          backgroundColor: AppColors.white,
                          isStadiumBorder: false,
                          textStyle: AppStyles.semiBold20blue,
                          onTap: () {
                            signupCubit.signUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                              rePassword: _rePasswordController.text,
                              phone: _mobileNumberController.text,
                              name: _fullNameController.text,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppStyles.medium18white,
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.loginRoute),
                          child: Text(
                            'Login',
                            style: AppStyles.medium18white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
