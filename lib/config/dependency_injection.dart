import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/main/presentation/controller/main_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initMain() {
  disposeSplash();
  Get.put<HomeController>(HomeController());
  Get.put<MainController>(MainController());
}
