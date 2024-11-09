import 'package:flutter/material.dart';

class ManagerColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color lightBlackColor = Colors.black38;
  static const Color uselectedTextColor = Colors.white;
  static const Color unselectedDayColor = Color.fromARGB(40, 0, 0, 0);
  static const Color backgroundColor = Color(0xFFFBFBFE);
  static const Color unselectedItemColor = Color.fromARGB(255, 209, 209, 209);
  static const Color greyLight = Color.fromARGB(255, 210, 210, 210);
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color(0xFF3F51B5);
  static const Color primaryColorLight = Color(0xFF757DE8);
  static const Color softGreyColor = Color.fromARGB(255, 245, 244, 244);
  static const Color lightYellowColor = Color(0xFFFDD835);
  static const Color dividerColor = Color(0xFFEFEEF0);
  static const Color greyTextColor = Color(0xFF827D89);
  static const Color textColorLight = Color(0xff525167);
  static Color tabBackgroundColor = Colors.grey.shade300.withOpacity(0.2);

  static Gradient primaryGradientColor = const LinearGradient(
    colors: [primaryColorLight, primaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
