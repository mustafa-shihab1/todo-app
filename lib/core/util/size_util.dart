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

// Padding/Margin
  static EdgeInsets setEdgeInsets({
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

  // Symmetric sides Padding/Margin
  static EdgeInsets setSymmetricEdgeInsets(
      {double vertical = 0, double horizontal = 0}) {
    return EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
  }

  // All sides Padding/Margin
  static EdgeInsets setAllEdgeInsets(double value) {
    return EdgeInsets.all(value.w);
  }
}
