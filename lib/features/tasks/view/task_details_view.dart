import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/validator/validator.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../home/presentation/controller/home_controller.dart';
import '../../../main/presentation/view/custom_appbar.dart';

class TaskDetailsView extends StatelessWidget {
  final int taskIndex;

  const TaskDetailsView({super.key, required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    FieldValidator validator = FieldValidator();
    return Scaffold(
      backgroundColor: ManagerColors.backgroundColor,
      appBar: customHomeAppBar(isHomePage: false),
      body: Padding(
        padding:
            ManagerSetEdgeInsets.setSymmetric(horizontal: ManagerWidth.w16),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            initState: (_) =>
                Get.find<HomeController>().initControllers(taskIndex),
            builder: (controller) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ManagerStrings.taskDetails,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.black),
                    ),
                    SizedBox(height: ManagerHeight.h20),
                    Text(ManagerStrings.title,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black)),
                    SizedBox(height: ManagerHeight.h6),
                    customTextField(
                        validator: (value) => validator.validateText(value),
                        hintText: ManagerStrings.addTitle,
                        controller: controller.titleController,
                        radius: ManagerRadius.r10),
                    SizedBox(height: ManagerHeight.h20),
                    Text(ManagerStrings.note,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black)),
                    SizedBox(height: ManagerHeight.h6),
                    customTextField(
                        validator: (value) => validator.validateText(value),
                        hintText: ManagerStrings.addNote,
                        controller: controller.descController,
                        radius: ManagerRadius.r10),
                    SizedBox(height: ManagerHeight.h20),
                    Text(ManagerStrings.date,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black)),
                    SizedBox(height: ManagerHeight.h6),
                    customTextField(
                        hintText: ManagerStrings.selectDate,
                        controller: controller.dateController,
                        radius: ManagerRadius.r10,
                        suffixIcon: const Icon(Icons.calendar_month_outlined,
                            color: ManagerColors.grey),
                        readOnly: true,
                        onTap: () => controller.selectDate(context)),
                    SizedBox(height: ManagerHeight.h20),
                    Text(ManagerStrings.time,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black)),
                    SizedBox(height: ManagerHeight.h6),
                    customTextField(
                        hintText: ManagerStrings.selectTime,
                        controller: controller.timeController,
                        radius: ManagerRadius.r10,
                        suffixIcon: const Icon(Icons.watch_later_outlined,
                            color: ManagerColors.grey),
                        readOnly: true,
                        onTap: () => controller.selectTime(context)),
                    SizedBox(height: ManagerHeight.h20),
                    Text(ManagerStrings.repeat,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black)),
                    SizedBox(height: ManagerHeight.h6),
                    DropdownButtonFormField(
                      hint: Text(
                        'Select an option',
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.greyLight),
                      ),
                      value: controller.selectedOption,
                      items: controller.repeatOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedOption = value;
                        controller.update();
                      },
                      borderRadius: BorderRadius.circular(ManagerRadius.r10),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: ManagerColors.grey),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w10,
                            vertical: ManagerHeight.h10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r10),
                            borderSide: const BorderSide(
                                color: ManagerColors.greyLight)),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h60),
                    MainButton(
                        onPressed: () {
                          controller.performUpdate(taskIndex);
                        },
                        btnTitle: ManagerStrings.updateTask,
                        btnColor: ManagerColors.primaryColor,
                        borderColor: ManagerColors.primaryColor,
                        borderRadius: 12,
                        titleColor: ManagerColors.white),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
