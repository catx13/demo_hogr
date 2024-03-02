import 'package:get/get.dart';

class Page2Controller extends GetxController {
  var isFullscreenDialog = false.obs;

  // Method to set the value of isFullscreenDialog
  void setFullscreenDialog(bool value) {
    isFullscreenDialog.value = value;
  }
}
