import 'package:flutter/material.dart';
import 'package:todo_app/core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../widgets/custom_search_box.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ManagerColors.dividerColor,
          thickness: 2,
        ),
        SizedBox(
          height: ManagerHeight.h20,
        ),
        const CustomSearchBox(),
      ],
    );
  }
}
