import 'package:flutter/material.dart';

class ManagerColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color greyLight = Color.fromARGB(255, 210, 210, 210);
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color(0xFF592F8D);
  static const Color primaryColorLight = Color(0xFF9C6ADB);

  static Gradient splashGradientColor = const LinearGradient(
    colors: [primaryColorLight, primaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
