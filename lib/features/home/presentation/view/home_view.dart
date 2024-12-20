import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/features/home/presentation/view/widgets/task_details.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../features/home/presentation/controller/home_controller.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import 'widgets/calendar_item_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: ManagerSetEdgeInsets.setSymmetric(
            vertical: ManagerHeight.h2, horizontal: ManagerWidth.w14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.getFullDate(),
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.lightBlackColor)),
            SizedBox(
              height: ManagerHeight.h10,
            ),
            CalendarItemBuilder(
              controller: controller,
            ),
            SizedBox(
              height: ManagerHeight.h30,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => const TaskDetails(),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ManagerHeight.h20),
                  itemCount: 10),
            ),
            //const CustomStartHomeItem(),
          ],
        ),
      );
    });
  }
}
