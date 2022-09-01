import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final emailC = TextEditingController();
  final passC = TextEditingController();
  final nameC = TextEditingController();
  final nomorindukC = TextEditingController();
  final divisiC = "".obs;
  final count = 0.obs;
  var isPasswordHidden = true.obs;

  void setDivisi(String divisi) {
    divisiC.value = divisi;
    log(divisiC.value);
  }

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
