import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/features/home/presentation/view/widgets/task_details.dart';
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
