import 'dart:convert';
import 'package:demo_app_1/models/snack_model.dart';
import 'package:flutter/services.dart'; // Import rootBundle
import 'package:get/get.dart';

class Page3Controller extends GetxController {
  var items = <Snack>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPage3Data();
  }

  void fetchPage3Data() async {
    try {
      // Load JSON file from lib folder
      String jsonString =
          await rootBundle.loadString('lib/datastore/page3.json');

      // Parse JSON string
      var jsonData = jsonDecode(jsonString);

      // Extract items from JSON and add them to the list
      var itemList = jsonData['page3'] as List;
      items.assignAll(itemList.map((item) => Snack(item)).toList());
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }
}
