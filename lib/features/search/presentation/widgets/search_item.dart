import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/routes.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../core/storage/local/database/model/note.dart';
import '../../../home/presentation/controller/home_controller.dart';

class SearchItem extends StatelessWidget {
  Note note;
  SearchItem({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.taskDetailsView,
              arguments:
                  controller.notes.indexWhere((item) => item.id == note.id));
        },
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
                      '${note.title}',
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black),
                    ),
                    Text(
                      '${note.desc}',
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
                          '${'${note.repeat}'} : ${'${note.time}'}',
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
      );
    });
  }
}
