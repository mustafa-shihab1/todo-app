import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/routes.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/home_controller.dart';

class TaskCardItem extends StatelessWidget {
  int noteIndex;
  TaskCardItem({required this.noteIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () => Get.toNamed(Routes.taskDetailsView, arguments: noteIndex),
        child: Slidable(
          startActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ManagerRadius.r16),
                  bottomLeft: Radius.circular(ManagerRadius.r16)),
              onPressed: (context) async {
                await controller.delete(
                    controller.notes[noteIndex].id, context);
              },
              backgroundColor: ManagerColors.red,
              icon: Icons.delete_outline_rounded,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) async {
                await controller.completeNote(controller.notes[noteIndex]);
              },
              backgroundColor: ManagerColors.green,
              icon: Icons.task_alt_sharp,
              label: 'Done',
            ),
          ]),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w16,
              vertical: ManagerHeight.h20,
            ),
            decoration: BoxDecoration(
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r16),
              boxShadow: [
                BoxShadow(
                  color: ManagerColors.greyLight.withOpacity(0.3),
                  blurRadius: ManagerRadius.r16,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.notes[noteIndex].title}',
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                      ),
                      Text(
                        '${controller.notes[noteIndex].desc}',
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(
                        height: 14.0,
                        endIndent: 250,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: ManagerIconSize.s14,
                          ),
                          SizedBox(
                            width: ManagerWidth.w4,
                          ),
                          Text(
                            '${'${controller.notes[noteIndex].repeat}'} : ${'${controller.notes[noteIndex].time}'}',
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s10,
                                color: ManagerColors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
