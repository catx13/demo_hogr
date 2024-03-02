// page_2.dart
import 'package:demo_app_1/controllers/page2_controller.dart';
import 'package:demo_app_1/screens/tabs/page_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_1/screens/tabs/page_3.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Retrieve the Page2Controller using Get.find<Page2Controller>()
            Page2Controller page2Controller = Get.put(Page2Controller());
            // Determine if Page3 renders inside Page1 or as a full screen dialog.
            if (page2Controller.isFullscreenDialog.value) {
              Get.to(
                Page3(),
                fullscreenDialog: page2Controller.isFullscreenDialog.value,
              );
            } else {
              Get.toNamed(Page1Navigation.page3, id: Page1Navigation.id);
            }
          },
          child: const Text('Page 3'),
        ),
      ),
    );
  }
}
