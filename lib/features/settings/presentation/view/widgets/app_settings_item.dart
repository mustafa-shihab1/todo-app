import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';

class AppSettingsItem extends StatelessWidget {
  IconData icon;
  String text;
  void Function()? onTap;
  AppSettingsItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManagerSetEdgeInsets.setAll(12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 26,
            ),
            SizedBox(
              width: ManagerWidth.w10,
            ),
            Text(
              text,
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s18, color: ManagerColors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ManagerColors.grey,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
