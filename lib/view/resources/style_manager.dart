import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/resources/font_manager.dart';

import 'color_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, color: color, fontFamily: fontFamily);
}

//Regular text style
TextStyle getRegularStyle({double fontSize = FontSize.f16, Color color = ColorManager.textColor}) {
  return TextStyle(
      fontWeight: FontWeightManger.regular, fontSize: fontSize, fontFamily: FontConstant.fontFamily, color: color);
}

//Regular text style
TextStyle getMediumStyle({double fontSize = FontSize.f16, Color color = ColorManager.textColor}) {
  return TextStyle(
      fontWeight: FontWeightManger.medium, fontSize: fontSize, fontFamily: FontConstant.fontFamily, color: color);
}

TextStyle getButtonStyle({double fontSize = FontSize.f18, Color color = ColorManager.white}) {
  return TextStyle(
      fontWeight: FontWeightManger.medium, fontSize: fontSize, fontFamily: FontConstant.fontFamily, color: color);
}

TextStyle getBoldStyle({double fontSize = FontSize.f16, required Color color}) {
  return _getTextStyle(fontSize, FontConstant.fontFamily, FontWeightManger.bold, color);
}

//SemiBold text style
TextStyle getSemiBoldStyle({double fontSize = FontSize.f16, Color color = ColorManager.textColor}) {
  return TextStyle(
      fontWeight: FontWeightManger.semiBold, fontSize: fontSize, fontFamily: FontConstant.fontFamily, color: color);
}
