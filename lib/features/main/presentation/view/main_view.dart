import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../home/presentation/view/widgets/gnav_bar.dart';
import '../controller/main_controller.dart';
import 'custom_appbar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: controller.currentIndex != 0
            ? customMainAppBar(title: controller.title[controller.currentIndex])
            : customHomeAppBar(),
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: ManagerColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: Padding(
            padding: ManagerAllEdgeInsets.p12,
            child: GNavBar(
              controller: controller,
            ),
          ),
        ),
      );
    });
  }
}
