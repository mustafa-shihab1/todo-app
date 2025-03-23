import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import '../resources/manager_styles.dart';

Widget customTextField({
  TextEditingController? controller,
  TextInputType? textInputType,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? Function(String?)? validator,
  void Function()? onTap,
  void Function(String)? onFieldSubmitted,
  String hintText = "",
  bool obSecure = false,
  double radius = 16,
  bool readOnly = false,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obSecure,
    onFieldSubmitted: onFieldSubmitted,
    keyboardType: textInputType,
    onTap: onTap,
    textInputAction: TextInputAction.next,
    style: getRegularTextStyle(
      fontSize: ManagerFontSize.s14,
      color: ManagerColors.black,
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h10,
        horizontal: ManagerWidth.w10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.red,
        ),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.greyLight,
      ),
    ),
    readOnly: readOnly,
  );
}
