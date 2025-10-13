import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/cashe/shared_pref_utils.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../cubit/auth_state.dart';
import '../cubit/signin_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SigninCubit signinCubit = getIt<SigninCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, AuthState>(
      bloc: signinCubit,
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
            message: "login successfully",
            title: "Success",
            postActionName: "OK",
            onPostActionPressed: () {
              // ✅ Fixed parameter name
              //todo:save token
              SharedPrefUtils.saveData(
                  key: "token", value: state.authResponse.token);
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
                key: signinCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    Center(child: Image.asset(AppAssets.Route_image)),
                    SizedBox(height: 40.h),
                    Text('Welcome Back To Route',
                        style: AppStyles.semiBold24white),
                    Text(
                      'Please sign in with your mail',
                      style: AppStyles.light16lightWhite,
                    ),
                    SizedBox(height: 50.h),
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
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: AppStyles.regular18white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    Center(
                      child: SizedBox(
                        child: CustomElevatedButton(
                          label: 'Login',
                          backgroundColor: AppColors.white,
                          isStadiumBorder: false,
                          textStyle: AppStyles.semiBold20blue,
                          onTap: () {
                            signinCubit.signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
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
                          'Don\'t have an account?',
                          style: AppStyles.medium18white,
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.registerRoute),
                          child: Text(
                            'Create Account',
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
