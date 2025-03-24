import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../home/presentation/controller/home_controller.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.noteIndex,
    required this.controller,
  });
  final HomeController controller;
  final int noteIndex;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        'Select an option',
        style: getRegularTextStyle(
          fontSize: ManagerFontSize.s14,
          color: ManagerColors.greyLight,
        ),
      ),
      value: controller.repeatOptions,
      items: controller.repeatOptions.map(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) => controller.selectedOption = value.toString(),
      borderRadius: BorderRadius.circular(ManagerRadius.r10),
      icon: const Icon(Icons.arrow_drop_down, color: ManagerColors.grey),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
            borderSide: const BorderSide(color: ManagerColors.greyLight)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
          borderSide: const BorderSide(
            color: ManagerColors.greyLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
          borderSide: const BorderSide(
            color: ManagerColors.greyLight,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
          borderSide: const BorderSide(
            color: ManagerColors.red,
          ),
        ),
      ),
    );
  }
}
