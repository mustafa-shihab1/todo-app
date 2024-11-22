import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import '../resources/manager_styles.dart';

class MainButton extends StatelessWidget {
  void Function()? onPressed;
  String btnTitle;
  String btnSvgIcon;
  Color borderColor;
  Color iconColor;
  Color titleColor;
  MainButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    required this.btnSvgIcon,
    required this.borderColor,
    required this.iconColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: ManagerColors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor)),
      height: ManagerHeight.h50,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              btnSvgIcon,
              width: ManagerWidth.w18,
              color: iconColor,
            ),
            SizedBox(
              width: ManagerWidth.w8,
            ),
            Text(
              btnTitle,
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16, color: titleColor),
            ),
          ],
        ),
      ),
    );
  }
}
