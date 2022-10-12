import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;

  final isKeyboard = false.obs;

  final iconEmail = false.obs;
  final iconPass = false.obs;

  final count = 0.obs;
  var isPasswordHidden = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
