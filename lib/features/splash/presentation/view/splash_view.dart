import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/resources/manager_fonts.dart';
import 'package:todo_app/core/resources/manager_sizes.dart';
import 'package:todo_app/core/resources/manager_strings.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ManagerColors.primaryGradientColor),
      child: Scaffold(
        backgroundColor: ManagerColors.transparent,
        body: Padding(
          padding: ManagerAllEdgeInsets.p20,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: ManagerWidth.w250,
                  child: Image.asset(
                    ManagerAssets.splashImg,
                  )),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              Text(
                ManagerStrings.appName,
                style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s20,
                  color: ManagerColors.white,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
