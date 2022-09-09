import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LupaSandiController extends GetxController {
  //TODO: Implement LupaSandiController

  late TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void lupaSandi(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      try {
        auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Reset password sudah dikirim. Cek email anda',
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: 'Okay');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan',
            middleText: 'Tidak dapat mengirimkan reset password');
      }
    } else {
      title:
      'Terjadi kesalahan';
      middleText:
      'Email tidak valid';
    }
  }

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
