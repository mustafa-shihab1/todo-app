import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';

class CustomStartHomeItem extends StatelessWidget {
  const CustomStartHomeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            ManagerAssets.homeStartImg,
          ),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Text(ManagerStrings.startTitle,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s18, color: ManagerColors.black)),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Text(
            ManagerStrings.startSubtitle,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s14,
                color: ManagerColors.lightBlackColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
