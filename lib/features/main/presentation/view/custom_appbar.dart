import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_styles.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';

AppBar customMainAppBar({
  String title = "",
}) =>
    AppBar(
      backgroundColor: ManagerColors.backgroundColor,
      elevation: Constants.appBarElevation,
      title: Text(
        title,
        style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.black),
      ),
      centerTitle: true,
    );

PreferredSize customHomeAppBar({
  bool isHomePage = true,
}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: AppBar(
        backgroundColor: ManagerColors.backgroundColor,
        elevation: Constants.appBarElevation,
        leading: isHomePage
            ? IconButton(
                onPressed: () {}, icon: const Icon(Icons.nightlight_outlined))
            : IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          Container(
              margin: ManagerSetEdgeInsets.setSymmetric(
                  horizontal: ManagerWidth.w12),
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
      ));
}
