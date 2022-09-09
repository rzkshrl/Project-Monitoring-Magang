import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditEmailpassController extends GetxController {
  //TODO: Implement EditEmailpassController

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  final count = 0.obs;
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
