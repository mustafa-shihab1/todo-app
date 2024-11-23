import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          color: ManagerColors.dividerColor,
          thickness: 1,
        ),
      ],
    );
  }
}
