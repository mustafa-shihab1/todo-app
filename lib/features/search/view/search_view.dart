import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../controller/search_controller.dart';
import '../widgets/task_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchsController>(builder: (controller) {
      return Column(
        children: [
          const Divider(
            color: ManagerColors.dividerColor,
            thickness: 1,
          ),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Padding(
            padding: ManagerSetEdgeInsets.setSymmetric(
                vertical: ManagerHeight.h2, horizontal: ManagerWidth.w14),
            child: Container(
              decoration: BoxDecoration(
                  color: ManagerColors.softGreyColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.searchList.clear();
                    controller.update();
                  } else {
                    controller.search(value);
                  }
                },
                controller: controller.searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ManagerColors.greyLight,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ManagerColors.greyLight,
                        )),
                    hintText: ManagerStrings.search,
                    hintStyle: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.grey)),
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.black),
              ),
            ),
          ),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Visibility(
            replacement: const Text('No Tasks Found!'),
            visible: controller.searchList.isNotEmpty,
            child: Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => TaskCard(
                        isCompleted: false,
                        note: controller.searchList[index],
                      ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ManagerHeight.h20),
                  itemCount: controller.searchList.length),
            ),
          ),
        ],
      );
    });
  }
}
