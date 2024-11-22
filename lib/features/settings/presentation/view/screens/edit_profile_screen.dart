import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../main/presentation/view/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(
        title: ManagerStrings.editProfile,
      ),
      body: Column(
        children: [
          const Divider(
            color: ManagerColors.dividerColor,
            thickness: 2,
          ),
          SizedBox(height: ManagerHeight.h24),
          Container(
              clipBehavior: Clip.antiAlias,
              width: ManagerWidth.w120,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(ManagerAssets.defaultUserImg)),
          SizedBox(height: ManagerHeight.h18),
          Padding(
            padding: ManagerSymmetricEdgeInsets.v0h100,
            child: MainButton(
              onPressed: () {},
              btnTitle: ManagerStrings.changeImage,
              btnSvgIcon: ManagerAssets.changeImgIcon,
              iconColor: ManagerColors.black,
              titleColor: ManagerColors.black,
              borderColor: ManagerColors.greyLight,
            ),
          ),
          SizedBox(height: ManagerHeight.h50),
          Text('FullNAme')
        ],
      ),
    );
  }
}
