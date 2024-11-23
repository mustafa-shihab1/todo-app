import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import '../resources/manager_styles.dart';

Widget customTextField({
  required String hintText,
  bool obSecure = false,
  required TextEditingController controller,
  String? Function(String?)? validator,
  Widget? suffixIcon,
  Widget? prefixIcon,
  void Function()? onTap,
  onChange,
  TextInputType? textInputType,
  FocusNode? focusNode,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obSecure,
    keyboardType: textInputType,
    onTap: onTap,
    focusNode: focusNode,
    onChanged: onChange ?? (val) {},
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
          ManagerRadius.r16,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r16,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r16,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.greyLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r16,
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
  );
}
