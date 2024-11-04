import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/completed_view.dart';
import '../view/screens/home_view.dart';
import '../view/screens/search_view.dart';
import '../view/screens/settings_view.dart';

class MainController extends GetxController {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CompletedView(),
    const SettingsView(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
    try {
      debugPrint(
          "Main Controller Index Changed -> ${screens[index].toString()}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
