import 'package:flutter/material.dart';

class Routes {}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found!"),
        ),
        body: const Center(
          child: Text("No Route Found!"),
        ),
      ),
    );
  }
}
