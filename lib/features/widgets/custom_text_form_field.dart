import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color? backgroundColor;
  Color borderColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  int? maxLines;
  Widget? prefixIcon;

  ///we make it of type widget to have the freedom to send it as icon or image
  Widget? suffixIcon;

  ///we make it of type widget to have the freedom to send it as icon or image
  OnValidator? validator;
  TextInputType keyboardType;
  bool isObscureText;
  String? obscuringCharacter;
  TextEditingController controller;
  CustomTextFormField(
      {super.key,
      this.borderColor = Colors.grey,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.isObscureText = false,
      this.obscuringCharacter,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(borderColor: borderColor),
        focusedBorder: builtDecorationBorder(borderColor: borderColor),
        errorBorder: builtDecorationBorder(borderColor: Colors.red),
        focusedErrorBorder: builtDecorationBorder(borderColor: Colors.red),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.light16lightWhite,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.medium18white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle:
            AppStyles.medium18white.copyWith(color: Colors.red, fontSize: 14),
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText,
    );
  }

  OutlineInputBorder builtDecorationBorder({borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
  }
}
