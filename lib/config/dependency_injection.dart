import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../features/search/presentation/controller/search_controller.dart';
import '../core/storage/local/database/provider/database_provider.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/main/presentation/controller/main_controller.dart';
import '../features/settings/presentation/controller/settings_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../features/tasks/presentation/controller/task_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider().initDatabase();
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initMain() {
  disposeSplash();
  Get.put<HomeController>(HomeController());
  Get.put<SettingsController>(SettingsController());
  Get.put<TaskController>(TaskController());
  Get.put<SearchsController>(SearchsController());
  Get.put<MainController>(MainController());
}
