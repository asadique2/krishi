import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_vikas/constant/color.dart';
import 'package:krishi_vikas/module/home/controller/home_controller.dart';

class LanguageSelectionView extends GetView<HomeController> {
  const LanguageSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Select Your Language',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.baseColor),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.builder(
                itemCount: controller.languageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? 2
                        : 3),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        if (controller.languageList[index].englishName ==
                            'english') {
                          Get.updateLocale(const Locale('en', 'US'));
                        } else if (controller.languageList[index].englishName ==
                            'hindi') {
                          Get.updateLocale(const Locale('hi', 'IN'));
                        } else if (controller.languageList[index].englishName ==
                            'bengali') {
                          Get.updateLocale(const Locale('bn', 'BD'));
                        }

                        controller.changeLanguage(
                            language:
                                controller.languageList[index].englishName);
                      },
                      child: GridTile(
                          child: Container(
                        child: Column(
                          children: [
                            Text(
                              controller.languageList[index].nativeName[0],
                              style: GoogleFonts.notoSerif(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                  color: Colors.redAccent),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.languageList[index].nativeName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(controller.languageList[index].englishName),
                          ],
                        ),
                      ) //just for testing, will fill with image later
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
