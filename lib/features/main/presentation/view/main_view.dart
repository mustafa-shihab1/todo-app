import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_styles.dart';
import '../controller/main_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        extendBody: true,
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: ManagerColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: Padding(
            padding: ManagerPaddingAll.p12,
            child: GNav(
                selectedIndex: controller.currentIndex,
                onTabChange: (value) {
                  controller.changeCurrentIndex(value);
                },
                backgroundColor: ManagerColors.primaryColor,
                color: ManagerColors.unselectedItemColor,
                activeColor: ManagerColors.white,
                tabBackgroundColor: ManagerColors.tabBackgroundColor,
                padding: ManagerPaddingSymmetric.v14h20,
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: ManagerStrings.home,
                    textStyle: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.white),
                  ),
                  GButton(
                    icon: Icons.search,
                    text: ManagerStrings.search,
                    textStyle: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.white),
                  ),
                  GButton(
                    icon: Icons.task_alt_sharp,
                    text: ManagerStrings.completed,
                    textStyle: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.white),
                  ),
                  GButton(
                    icon: Icons.settings_outlined,
                    text: ManagerStrings.settings,
                    textStyle: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.white),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
