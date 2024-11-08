import 'package:flutter/material.dart';
import 'package:todo_app/core/resources/manager_fonts.dart';
import 'package:todo_app/core/resources/manager_styles.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManagerSymmetricEdgeInsets.v2h14,
      child: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h40,
          ),
          Container(
            decoration: BoxDecoration(
                color: ManagerColors.softGreyColor,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: ManagerStrings.search,
                  hintStyle: getRegularTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.grey)),
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s12, color: ManagerColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
