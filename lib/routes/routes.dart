import 'package:flutter/material.dart';
import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/main/view/main_view.dart';
import '../features/settings/view/screens/edit_profile_screen.dart';
import '../features/splash/view/splash_view.dart';
import '../features/tasks/view/add_task_view.dart';
import '../features/tasks/view/task_details_view.dart';

class Routes {
  static const String splashView = "/splash_view";
  static const String mainView = "/main_view";
  static const String editProfileView = "/edit_profile_screen";
  static const String addTaskView = "/add_task_view";
  static const String taskDetailsView = "/task_details_view";
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
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.addTaskView:
        return MaterialPageRoute(builder: (_) => const AddTaskView());
      case Routes.taskDetailsView:
        final int taskIndex = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => TaskDetailsView(
                  taskIndex: taskIndex,
                ));
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
