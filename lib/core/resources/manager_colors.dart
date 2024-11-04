import 'package:flutter/material.dart';

class ManagerColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color backgroundColor = Color(0xffFAFAFA);
  static const Color unselectedItemColor = Color.fromARGB(255, 209, 209, 209);
  static const Color greyLight = Color.fromARGB(255, 210, 210, 210);
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color.fromARGB(255, 100, 53, 158);
  static const Color primaryColorLight = Color(0xFF9C6ADB);
  static const Color textColorLight = Color(0xff525167);
  static Color tabBackgroundColor = Colors.grey.shade300.withOpacity(0.2);

  static Gradient primaryGradientColor = const LinearGradient(
    colors: [primaryColorLight, primaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static Gradient secondaryGradientColor = const LinearGradient(
    colors: [primaryColorLight, Color.fromARGB(255, 108, 58, 170)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
