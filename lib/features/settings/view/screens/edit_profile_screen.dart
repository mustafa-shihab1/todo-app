import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/resources/manager_fonts.dart';
import 'package:todo_app/core/resources/manager_styles.dart';

import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../main/view/custom_appbar.dart';
import '../../controller/settings_controller.dart';

class EditProfileScreen extends StatelessWidget {
  // final FieldValidator _validator = FieldValidator();
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundColor,
      appBar: customMainAppBar(
        title: ManagerStrings.editProfile,
      ),
      body: GetBuilder<SettingsController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: ManagerColors.dividerColor,
              thickness: 1,
            ),
            SizedBox(height: ManagerHeight.h24),
            Center(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: ManagerWidth.w120,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(ManagerAssets.defaultUserImg)),
            ),
            SizedBox(height: ManagerHeight.h18),
            Padding(
              padding: ManagerSetEdgeInsets.setSymmetric(
                  horizontal: ManagerWidth.w100),
              child: MainButton(
                onPressed: () {},
                btnTitle: ManagerStrings.changeImage,
                btnSvgIcon: ManagerAssets.changeImgIcon,
                iconColor: ManagerColors.black,
                titleColor: ManagerColors.black,
                borderColor: ManagerColors.greyLight,
                borderRadius: 25,
              ),
            ),
            SizedBox(height: ManagerHeight.h24),
            Padding(
              padding: ManagerSetEdgeInsets.setSymmetric(
                  horizontal: ManagerWidth.w16),
              child: const Divider(
                color: ManagerColors.dividerColor,
                thickness: 1,
              ),
            ),
            SizedBox(height: ManagerHeight.h24),
            Padding(
              padding: ManagerSetEdgeInsets.setSymmetric(
                  horizontal: ManagerWidth.w16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ManagerStrings.fullName,
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.black),
                    ),
                    SizedBox(height: ManagerHeight.h12),
                    customTextField(
                      controller: controller.nameController,
                      hintText: ManagerStrings.fullName,
                      textInputType: TextInputType.text,
                      // validator: _validator,
                    ),
                    SizedBox(height: ManagerHeight.h32),
                    Text(
                      ManagerStrings.emailAddress,
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.black),
                    ),
                    SizedBox(height: ManagerHeight.h12),
                    customTextField(
                      controller: controller.emailController,
                      hintText: ManagerStrings.emailAddress,
                      textInputType: TextInputType.emailAddress,
                      // validator: _validator,
                    ),
                    SizedBox(
                      height: ManagerHeight.h120,
                    ),
                    MainButton(
                      onPressed: () {},
                      btnTitle: ManagerStrings.save,
                      titleColor: ManagerColors.white,
                      borderColor: ManagerColors.primaryColorLight,
                      btnColor: ManagerColors.primaryColorLight,
                      borderRadius: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
