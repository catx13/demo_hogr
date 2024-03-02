// tab_view.dart
import 'package:demo_app_1/controllers/page2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_1/screens/tabs/page_1.dart';
import 'package:demo_app_1/screens/tabs/page_2.dart';
import 'package:demo_app_1/screens/tabs/page_3.dart';

class TabController extends GetxController {
  var currentIndex = 0.obs;
  final page2Controller = Get.put(Page2Controller());

  void changeTabIndex(int index) {
    if (index == currentIndex.value) {
      Get.back(closeOverlays: true);
    }
    index == 2 ? currentIndex.value = 1 : currentIndex.value = index;
    if (currentIndex.value == 1) {
      page2Controller.setFullscreenDialog(true);
    }
  }
}

class TabView extends StatelessWidget {
  final TabController tabController = Get.put(TabController());

  TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return IndexedStack(
        index: tabController.currentIndex.value,
        children: [Page1(), const Page2(), Page3()],
      );
    }), bottomNavigationBar: Obx(() {
      return BottomNavigationBar(
        currentIndex: tabController.currentIndex.value,
        onTap: (index) => tabController.changeTabIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tab 3',
          ),
        ],
      );
    }));
  }
}
