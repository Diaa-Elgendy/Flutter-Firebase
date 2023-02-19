import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/resources/color_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String text;
  bool isPassword;
  TextInputType textInputType;
  VoidCallback? suffixPressed;
  IconData? suffix;
  IconData? prefix;
  int maxLines;

  CustomTextField(
      {required this.controller,
        required this.text,
        this.isPassword = false,
        this.suffixPressed,
        this.textInputType = TextInputType.text,
        this.suffix,
        this.prefix,
        this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    bool readOnly = false;

    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        // prefixIcon: prefix != null ? Icon(prefix, color: ColorManager.textColor) : null,
        contentPadding: const EdgeInsets.all(18),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix, color: ColorManager.textColor),
          onPressed: suffixPressed,
        )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: const BorderSide(
            color: ColorManager.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: const BorderSide(
            color: ColorManager.grey,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: const BorderSide(
            color: ColorManager.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: const BorderSide(
            color: ColorManager.red,
            width: 1,
          ),
        ),
        labelStyle: getRegularStyle(fontSize: 18),
      ),
      scrollPadding: const EdgeInsets.all(0),
      keyboardType: textInputType,
      style: getRegularStyle(fontSize: 18),
      controller: controller,
      obscureText: isPassword,


      cursorColor: ColorManager.primary,
      readOnly: readOnly,
      validator: (value) {
        if (value!.isEmpty) {
          return '$text must not be empty';
        }
        return null;
      },
    );
  }
}
