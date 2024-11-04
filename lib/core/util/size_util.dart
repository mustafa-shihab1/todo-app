import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeUtil {
// Width (dp)
  static double setWidth(double width) {
    return width.w;
  }

// Height (dp)
  static double setHeight(double height) {
    return height.h;
  }

// Font Size (sp)
  static double setFontSize(double font) {
    return font.sp;
  }

// Radius (dp)
  static double setRadius(double radius) {
    return radius.r;
  }

// Padding
  static EdgeInsets setPadding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left.w,
      top: top.h,
      right: right.w,
      bottom: bottom.h,
    );
  }

  // Symmetric sides Padding
  static EdgeInsets setSymmetricPadding(double height, double width) {
    return EdgeInsets.symmetric(vertical: height.h, horizontal: width.w);
  }

  // All sides Padding
  static EdgeInsets setAllPadding(double value) {
    return EdgeInsets.all(value.w);
  }
}
