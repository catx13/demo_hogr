// page_1.dart
import 'package:demo_app_1/controllers/page2_controller.dart';
import 'package:demo_app_1/screens/tabs/page_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_1/screens/tabs/page_2.dart';

class Page1Navigation {
  Page1Navigation._();

  static const id = 0;
  static const page1 = '/page1';
  static const page2 = '/page2';
  static const page3 = '/page3';
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Page1Navigation.id),
      onGenerateRoute: (settings) {
        if (settings.name == Page1Navigation.page2) {
          return GetPageRoute(
            routeName: Page1Navigation.page2,
            page: () => const Page1Wrapper(
              id: Page1Navigation.id,
              second: true,
            ),
          );
        } else if (settings.name == Page1Navigation.page3) {
          return GetPageRoute(
            routeName: Page1Navigation.page3,
            page: () => Page3(),
          );
        }
        return GetPageRoute(
          routeName: Page1Navigation.page1,
          page: () => const Page1Wrapper(id: Page1Navigation.id, first: true),
        );
      },
    );
  }
}

class Page1Wrapper extends StatelessWidget {
  final int? id;
  final bool? first;
  final bool? second;
  const Page1Wrapper({super.key, this.id, this.first, this.second});
  @override
  Widget build(BuildContext context) {
    if (first ?? false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final page2Controller = Get.put(Page2Controller());
              page2Controller.setFullscreenDialog(false);
              Get.toNamed(Page1Navigation.page2, id: Page1Navigation.id);
            },
            child: const Text('Go to Page 2'),
          ),
        ),
      );
    } else if (second ?? false) {
      return const Page2();
    } else {
      return Page3();
    }
  }
}
