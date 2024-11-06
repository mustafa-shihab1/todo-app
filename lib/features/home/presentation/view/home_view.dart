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
      return Padding(
        padding: ManagerSymmetricEdgeInsets.v2h14,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
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
                  height: ManagerHeight.h30,
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              color: ManagerColors.greyLight,
                              borderRadius: BorderRadius.circular(16)),
                          child: Card(
                            color: ManagerColors.white,
                            elevation: 0,
                            child: Padding(
                              padding: ManagerAllEdgeInsets.p10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Title',
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: ManagerColors.black),
                                  ),
                                  Text(
                                    'write the description here! write the description here!write the description here!write the description here!write the description here!write the description here!write the description here!',
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s10,
                                        color: ManagerColors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Divider(
                                    height: 14.0,
                                    endIndent: 300,
                                  ),
                                  Text(
                                    'Daily : 2:30pm',
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s10,
                                        color: ManagerColors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: ManagerHeight.h20),
                      itemCount: 10),
                ),
                //const CustomStartHomeItem(),
              ],
            ),
            Positioned(
              right: 0,
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
