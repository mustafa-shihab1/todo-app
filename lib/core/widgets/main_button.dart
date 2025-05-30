import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import '../resources/manager_styles.dart';

class MainButton extends StatelessWidget {
  void Function()? onPressed;
  String btnTitle;
  Color titleColor;
  double borderRadius;
  Color borderColor;
  Color? btnColor = ManagerColors.white;
  String? btnSvgIcon;
  Color? iconColor;
  MainButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    required this.titleColor,
    required this.borderRadius,
    required this.borderColor,
    this.btnColor,
    this.btnSvgIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor)),
      height: ManagerHeight.h50,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnSvgIcon != null
                ? SvgPicture.asset(
                    btnSvgIcon!,
                    width: ManagerWidth.w18,
                    color: iconColor,
                  )
                : Container(),
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
