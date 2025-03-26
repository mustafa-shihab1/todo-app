import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../home/controller/home_controller.dart';
import '../../../search/widgets/task_card.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          const Divider(
            color: ManagerColors.dividerColor,
            thickness: 1,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => TaskCard(
                      note: controller.completedNotes[index],
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: ManagerHeight.h20),
                itemCount: controller.completedNotes.length),
          )
        ],
      );
    });
  }
}
