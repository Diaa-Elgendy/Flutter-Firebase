import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/resources/color_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  String label;
  Color labelColor;
  Color backgroundColor;
  VoidCallback onTap;
  Widget child;
  double labelSize;
  double? width, height;

  CustomElevatedButton(
      {Key? key,
      required this.onTap,
      this.label = '',
      this.child = const SizedBox(height: 0, width: 0),
      this.labelColor = ColorManager.white,
      this.width = 250,
      this.height = 45,
      this.labelSize = 20,
      this.backgroundColor = ColorManager.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radius)),
          ),
          child: label.isNotEmpty
              ? Text(
                  label,
                  style: getMediumStyle(color: labelColor, fontSize: labelSize),
                )
              : child,
        ));
  }
}

