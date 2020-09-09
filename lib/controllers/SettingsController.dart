import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  void changeTheme() => Get.changeTheme(Get.isDarkMode ? ThemeData(primarySwatch: Colors.deepPurple) : ThemeData.dark());

}