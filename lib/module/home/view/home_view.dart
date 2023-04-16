import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krishi_vikas/constant/color.dart';
import 'package:krishi_vikas/model/category_response.dart';
import 'package:krishi_vikas/module/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColor.baseColor),
        backgroundColor: AppColor.baseColor,
        actions: [Icon(Icons.notifications).paddingOnly(right: 20)],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.baseColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            SizedBox(width: 30),
            Icon(
              Icons.chat_bubble,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ).paddingSymmetric(vertical: 10, horizontal: 20),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 2)),
          child: Icon(
            Icons.add,
            size: 24,
          ).paddingAll(10),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: Get.width,
            child: Image.asset(
              'images/heder.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (Data category in controller.categoryListData)
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: SizedBox(
                          height: 45,
                          width: 45,
                          child: Image.network('${category.icon}'),
                        ).paddingAll(10),
                      ),
                      SizedBox(height: 20),
                      controller.selectedLanguage.value == 'english'
                          ? Text('${category.category}')
                          : (controller.selectedLanguage.value == 'hindi'
                              ? Text('${category.lnHn}')
                              : Text('${category.lnBn}'))
                    ],
                  ).paddingSymmetric(horizontal: 10)
              ],
            ),
          ),
          SizedBox(height: 35),
          Text(
            'Tractor',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.baseColor),
          ).paddingSymmetric(horizontal: 20),
          Expanded(
            child: Column(
              children: [
                // Add any other widgets above the TabBar
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(text: 'RENT'),
                            Tab(text: 'USED'),
                            Tab(text: 'NEW'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Text(' Rent Tab')),
                              Center(child: Text('Used Tab')),
                              Center(child: Text('New Tab')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add any other widgets below the TabBar
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
