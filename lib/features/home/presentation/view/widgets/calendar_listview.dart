import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../features/home/presentation/controller/home_controller.dart';
import '../../../../../core/resources/manager_colors.dart';

class CalenderListView extends StatelessWidget {
  const CalenderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        color: ManagerColors.backgroundColor,
        height: ManagerHeight.h100,
        child: ScrollablePositionedList.separated(
          itemScrollController: controller.itemController,
          scrollDirection: Axis.horizontal,
          itemCount: controller.currentMonthDays.length,
          itemBuilder: (context, index) {
            DateTime currentDate = controller.currentMonthDays[index];
            return GestureDetector(
              onTap: () {
                controller.changeSelectedDay(index);
              },
              child: Container(
                width: ManagerWidth.w65,
                decoration: BoxDecoration(
                  color: controller.selectedDayIndex == index
                      ? ManagerColors.primaryColorLight
                      : ManagerColors.unselectedDayColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.getMonth(currentDate),
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: controller.selectedDayIndex == index
                                ? ManagerColors.white
                                : ManagerColors.uselectedTextColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h6,
                      ),
                      Text(
                        controller.getDate(currentDate),
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: controller.selectedDayIndex == index
                                ? ManagerColors.white
                                : ManagerColors.uselectedTextColor),
                      ),
                      SizedBox(
                        height: ManagerHeight.h4,
                      ),
                      Text(
                        controller.getDay(currentDate),
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: controller.selectedDayIndex == index
                                ? ManagerColors.white
                                : ManagerColors.uselectedTextColor),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: ManagerWidth.w14,
          ),
        ),
      );
    });
  }
}
