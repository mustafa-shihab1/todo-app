import 'package:get/get.dart';
import '../../../../config/constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      //Get.offNamed(Routes.nextPage);
    });
  }
}
