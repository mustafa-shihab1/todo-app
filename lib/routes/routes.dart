import 'package:flutter/material.dart';
import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/main/presentation/view/main_view.dart';
import '../features/settings/presentation/view/screens/edit_profile_screen.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = "/splash_view";
  static const String mainView = "/main_view";
  static const String editProfileView = "/edit_profile_screen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mainView:
        initMain();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.editProfileView:
        // initMain();
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
