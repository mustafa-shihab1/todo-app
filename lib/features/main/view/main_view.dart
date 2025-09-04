import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../routes/routes.dart';
import '../../../core/notification/notification_service.dart';
import '../../home/view/widgets/gnav_bar.dart';
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
            : customHomeAppBar(isHomePage: true),
        body: IndexedStack(
          index: controller.currentIndex,
          children: controller.screens,
        ),
        floatingActionButton: controller.currentIndex != 0
            ? Container()
            : InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () async {
                  // await NotificationService().scheduleNotification(
                  //     id: 0,
                  //     title: 'text',
                  //     body: 'controller.descController!.text',
                  //     dateTime: DateTime.now().add(const Duration(seconds: 10)),
                  //     repeat: 'Once');

                  Get.toNamed(Routes.addTaskView);
                },
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: ManagerHeight.h60,
                    width: ManagerHeight.h60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: ManagerColors.primaryGradientColor,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: ManagerColors.white,
                    )),
              ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: ManagerColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: Padding(
            padding: ManagerSetEdgeInsets.setAll(12),
            child: GNavBar(
              controller: controller,
            ),
          ),
        ),
      );
    });
  }
}
