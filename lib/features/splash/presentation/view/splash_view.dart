import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/resources/manager_strings.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ManagerColors.splashGradientColor),
      child: Scaffold(
        backgroundColor: ManagerColors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  child: SvgPicture.asset(
                    ManagerAssets.splashImg,
                  )),
              const Text(
                ManagerStrings.appName,
                style: TextStyle(color: ManagerColors.greyLight, fontSize: 24),
              )
            ],
          )),
        ),
      ),
    );
  }
}
