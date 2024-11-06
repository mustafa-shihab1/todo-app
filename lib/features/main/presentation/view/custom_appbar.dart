import 'package:flutter/material.dart';
import 'package:todo_app/core/resources/manager_fonts.dart';
import 'package:todo_app/core/resources/manager_styles.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';

AppBar customMainAppBar({
  String title = "",
}) =>
    AppBar(
      backgroundColor: ManagerColors.transparent,
      elevation: Constants.appBarElevation,
      title: Text(
        title,
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.black),
      ),
      centerTitle: true,
    );

AppBar customHomeAppBar() {
  return AppBar(
    backgroundColor: ManagerColors.transparent,
    leading: IconButton(
        onPressed: () {}, icon: const Icon(Icons.nightlight_outlined)),
    actions: [
      Container(
          margin: ManagerSymmetricEdgeInsets.v0h12,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: CircleAvatar(
              child: Image.asset(ManagerAssets.defaultUserImg),
            ),
          )),
    ],
  );
}
