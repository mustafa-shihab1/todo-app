import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import 'widgets/calendar_listview.dart';
import '../../../../features/home/presentation/controller/home_controller.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_assets.dart';
import 'widgets/custom_starthome_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
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
        ),
        body: Stack(
          children: [
            Padding(
              padding: ManagerAllEdgeInsets.p16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.getFullDate(),
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.lightBlackColor)),
                  SizedBox(
                    height: ManagerHeight.h30,
                  ),
                  const CalenderListView(),
                  SizedBox(
                    height: ManagerHeight.h50,
                  ),
                  const CustomStartHomeItem(),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              right: ManagerWidth.w2,
              bottom: ManagerHeight.h70,
              child: MenuItemButton(
                clipBehavior: Clip.antiAlias,
                child: Container(
                    padding: ManagerAllEdgeInsets.p18,
                    margin: ManagerOnlySetEdgeInsets.mb30,
                    decoration: BoxDecoration(
                        gradient: ManagerColors.secondaryGradientColor,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: ManagerColors.white,
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
