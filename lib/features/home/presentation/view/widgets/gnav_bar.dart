import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../main/presentation/controller/main_controller.dart';

class GNavBar extends StatelessWidget {
  MainController controller;
  GNavBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
        selectedIndex: controller.currentIndex,
        onTabChange: (value) {
          controller.changeCurrentIndex(value);
        },
        backgroundColor: ManagerColors.primaryColor,
        color: ManagerColors.unselectedItemColor,
        activeColor: ManagerColors.white,
        tabBackgroundColor: ManagerColors.tabBackgroundColor,
        padding: ManagerSymmetricEdgeInsets.v14h20,
        tabs: [
          gNavButton(icon: Icons.home_outlined, text: ManagerStrings.home),
          gNavButton(icon: Icons.search, text: ManagerStrings.search),
          gNavButton(
              icon: Icons.task_alt_sharp, text: ManagerStrings.completed),
          gNavButton(
              icon: Icons.settings_outlined, text: ManagerStrings.settings),
        ]);
  }
}

GButton gNavButton(
    {IconData icon = Icons.home_outlined, String text = ManagerStrings.home}) {
  return GButton(
    icon: icon,
    text: text,
    textStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s12, color: ManagerColors.white),
  );
}
