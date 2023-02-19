import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/view/resources/color_manager.dart';
import 'package:flutter_firebase/view/resources/font_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    splashColor: ColorManager.primaryLight,
    scaffoldBackgroundColor: ColorManager.white,
    cardTheme: CardTheme(
      color: ColorManager.white,
      surfaceTintColor: ColorManager.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.radius)),
    ),
    // navigationDrawerTheme: const NavigationDrawerThemeData(
    //   backgroundColor: ColorManager.primary,
    //   surfaceTintColor: ColorManager.primary,
    // ),
    dividerTheme: const DividerThemeData(
      color: ColorManager.grey,
      thickness: 0.5
    ),

    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      titleTextStyle: getSemiBoldStyle(color: ColorManager.textColor, fontSize: FontSize.f22),
      elevation: AppSize.appBarElevation,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white
      ),
      iconTheme: const IconThemeData(color: ColorManager.white),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.primaryLight).copyWith(background: ColorManager.white),
  );
}
