import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/controller/home_controller.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';

class CalendarItemBuilder extends StatelessWidget {
  HomeController controller;
  CalendarItemBuilder({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker.itemBuilder(
      currentDate: controller.currentDate,
      headerOptions: HeaderOptions(
        headerBuilder: (context, date, onTap) => SizedBox(
          height: ManagerHeight.h40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${controller.getMonth(date)}, ${controller.getYear(date)}',
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColors.black),
              ),
              InkWell(
                  onTap: onTap,
                  child: const CircleAvatar(
                    backgroundColor: ManagerColors.transparent,
                    radius: 16,
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                    ),
                  )),
            ],
          ),
        ),
      ),
      timelineOptions: TimelineOptions(height: ManagerHeight.h100),
      firstDate: controller.currentDate
          .subtract(const Duration(days: 365)), // 1 year before current day
      lastDate: controller.currentDate
          .add(const Duration(days: 365)), // 1 year after current day
      selectionMode: const SelectionMode.autoCenter(),
      focusedDate: controller.selectedDate,
      itemExtent: 67.0,
      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: isSelected
                      ? ManagerColors.primaryColorLight
                      : ManagerColors.unselectedDayColor,
                  borderRadius: BorderRadius.circular(16),
                  border: isToday
                      ? Border.all(
                          color: ManagerColors.primaryColorLight, width: 1.5)
                      : null),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.getMonth(date),
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: isSelected
                              ? ManagerColors.white
                              : ManagerColors.uselectedTextColor),
                    ),
                    SizedBox(
                      height: ManagerHeight.h6,
                    ),
                    Text(
                      controller.getDate(date),
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: isSelected
                              ? ManagerColors.white
                              : ManagerColors.uselectedTextColor),
                    ),
                    SizedBox(
                      height: ManagerHeight.h4,
                    ),
                    Text(
                      controller.getDay(date),
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: isSelected
                              ? ManagerColors.white
                              : ManagerColors.uselectedTextColor),
                    )
                  ],
                ),
              )),
        );
      },
      onDateChange: (date) {
        controller.changeDay(date);
      },
    );
  }
}
