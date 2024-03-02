// main.dart
import 'package:demo_app_1/screens/layout/tab_layout.dart';
import 'package:demo_app_1/screens/tabs/page_1.dart';
import 'package:demo_app_1/screens/tabs/page_2.dart';
import 'package:demo_app_1/screens/tabs/page_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      getPages: <GetPage>[
        GetPage(
          name: '/',
          page: () => TabView(),
        ),
        GetPage(name: '/page1', page: () => Page1()),
        GetPage(name: '/page2', page: () => Page2()),
        GetPage(name: '/page3', page: () => Page3()),
      ],
      initialRoute: '/',
    );
  }
}
