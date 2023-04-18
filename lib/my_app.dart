import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_vikas/constant/languages.dart';
import 'package:krishi_vikas/module/home/view/language_selection_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LanguageSelectionView(),
    );
  }
}
