import 'dart:ffi';

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Color color;
  double radius;

  Loading({super.key, this.color = Colors.white, this.radius = 25});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
