import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_vikas/model/category_response.dart';
import 'package:krishi_vikas/module/home/view/home_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<LanguageModel> languageList = RxList([
    LanguageModel(nativeName: 'English', englishName: 'english'),
    LanguageModel(nativeName: 'हिंदी', englishName: 'hindi'),
    LanguageModel(nativeName: 'বাংলা', englishName: 'bengali'),
  ]);

  late TabController tabController;
  RxString selectedLanguage = RxString('english');
  RxList<Data> categoryListData = RxList([]);
  late Locale locale;
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getCategory();
    super.onInit();
  }

  getCategory() async {
    final dio = Dio();
    final response =
        await dio.get('https://kv.businessenquiry.co.in/api/category');

    if (response.statusCode == 200 || response.statusCode == 201) {
      CategoryResponse categoryData = CategoryResponse.fromJson(response.data);
      categoryData.data?.forEach((element) {
        categoryListData.add(element);
      });
    }
  }

  changeLanguage({required String language}) {
    selectedLanguage.value = language;
    Get.to(() => const HomeView());
  }
}

class LanguageModel {
  String englishName;
  String nativeName;
  LanguageModel({required this.englishName, required this.nativeName});
}
