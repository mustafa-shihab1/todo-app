import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../home/view/home_view.dart';
import '../../tasks/view/completed_view.dart';
import '../../search/view/search_view.dart';
import '../../settings/view/settings_view.dart';

class MainController extends GetxController {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CompletedView(),
    const SettingsView(),
  ];

  List<String> title = [
    ManagerStrings.home,
    ManagerStrings.search,
    ManagerStrings.completed,
    ManagerStrings.settings,
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
    try {
      debugPrint("Page Index Changed -> ${screens[index].toString()}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
