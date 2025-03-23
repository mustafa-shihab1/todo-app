import 'package:flutter/material.dart';
import '../../core/resources/manager_colors.dart';

mixin CustomSnackBar {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: error ? ManagerColors.red : ManagerColors.green,
      duration: const Duration(seconds: 1),
    ));
  }
}
