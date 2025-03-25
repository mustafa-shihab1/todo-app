import 'package:flutter/material.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';

class CustomSearchBox extends StatelessWidget {
  final searchController;
  const CustomSearchBox({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManagerSetEdgeInsets.setSymmetric(
          vertical: ManagerHeight.h2, horizontal: ManagerWidth.w14),
      child: Container(
        decoration: BoxDecoration(
            color: ManagerColors.softGreyColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ManagerColors.greyLight,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ManagerColors.greyLight,
                  )),
              hintText: ManagerStrings.search,
              hintStyle: getRegularTextStyle(
                  fontSize: ManagerFontSize.s14, color: ManagerColors.grey)),
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s14, color: ManagerColors.black),
        ),
      ),
    );
  }
}
