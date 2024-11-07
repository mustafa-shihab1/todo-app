import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                    'Title',
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black),
                  ),
                  Text(
                    'write the description here! write the description here! write the description here!',
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
                        'Daily : 2:30pm',
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s10,
                            color: ManagerColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline_rounded))
          ],
        ),
      ),
    );
  }
}
