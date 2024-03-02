// page_3.dart
import 'package:demo_app_1/controllers/page3controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  final Page3Controller controller = Get.put(Page3Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: GetBuilder<Page3Controller>(
        init: controller,
        builder: (controller) {
          if (controller.items.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.items[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
