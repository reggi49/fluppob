import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var rememberCheck = false.obs;
  TextEditingController loginUsername = TextEditingController();

  @override
  void onClose() {
    //TODO Implement onClose
    super.onClose();
  }
}
