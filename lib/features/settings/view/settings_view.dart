import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../routes/routes.dart';
import 'widgets/app_settings_item.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ManagerColors.dividerColor,
          thickness: 1,
        ),
        SizedBox(height: ManagerHeight.h30),
        Container(
            padding: ManagerSetEdgeInsets.setSymmetric(
                vertical: ManagerHeight.h2, horizontal: ManagerWidth.w14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        width: ManagerWidth.w65,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(ManagerAssets.defaultUserImg)),
                    SizedBox(width: ManagerWidth.w20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mustafa Shihab',
                            style: getBoldTextStyle(
                              color: ManagerColors.black,
                              fontSize: ManagerFontSize.s20,
                            ),
                          ),
                          SizedBox(height: ManagerHeight.h4),
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline_rounded,
                                color: ManagerColors.greyTextColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: ManagerWidth.w4,
                              ),
                              Text(
                                'mostafaa.sh2001@gmail.com',
                                style: getRegularTextStyle(
                                  color: ManagerColors.greyTextColor,
                                  fontSize: ManagerFontSize.s12,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h30,
                ),
                MainButton(
                  onPressed: () => Get.toNamed(Routes.editProfileView),
                  btnTitle: ManagerStrings.editProfile,
                  btnSvgIcon: ManagerAssets.editIcon,
                  borderColor: ManagerColors.primaryColor,
                  iconColor: ManagerColors.primaryColor,
                  titleColor: ManagerColors.primaryColor,
                  borderRadius: 25,
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                const Divider(
                  color: ManagerColors.dividerColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Text(
                  ManagerStrings.appSettings,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14, color: ManagerColors.grey),
                ),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                AppSettingsItem(
                  icon: Icons.notifications_none_outlined,
                  text: ManagerStrings.notification,
                ),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                AppSettingsItem(
                  icon: Icons.language,
                  text: ManagerStrings.language,
                ),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                AppSettingsItem(
                  icon: Icons.info_outline,
                  text: ManagerStrings.aboutApp,
                ),
              ],
            )),
      ],
    );
  }
}
