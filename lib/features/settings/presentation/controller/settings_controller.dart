import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}
