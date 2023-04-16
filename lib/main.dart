import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_vikas/module/home/controller/home_controller.dart';
import 'package:krishi_vikas/my_app.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}
