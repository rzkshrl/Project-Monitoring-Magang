import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileHRController extends GetxController {
  //TODO: Implement EditProfileHRController
  FirebaseAuth auth = FirebaseAuth.instance;

  final namaKey = GlobalKey<FormState>().obs;
  final divisiKey = GlobalKey<FormState>().obs;
  final nomorIndukKey = GlobalKey<FormState>().obs;

  late TextEditingController nameC = TextEditingController();
  late TextEditingController divisiC = TextEditingController();
  late var divisiCon = "".obs;
  void setDivisi(String divisi) {
    divisiCon.value = divisi;
    // log(divisiCon.value);
  }

  late TextEditingController nomorindukC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getUserDoc() async {
    String uid = auth.currentUser!.uid;
    DocumentReference user = firestore.collection("Users").doc(uid);
    return user.get();
  }

  void editProfil(String nama, String divisi, String nomorInduk) async {
    String uid = auth.currentUser!.uid;
    DocumentReference docUsers = firestore.collection("Users").doc(uid);

    try {
      await docUsers.update({
        "name": nama,
        "divisi": divisi,
        "nomor_induk": nomorInduk,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data",
        onConfirm: () {
          nameC.clear();
          divisiCon.close();
          nomorindukC.clear();

          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Tidak Berhasil Mengubah Data",
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    nameC = TextEditingController();
    divisiCon;
    nomorindukC = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameC.dispose();
    divisiC.dispose();
    nomorindukC.dispose();

    super.onClose();
  }

  void increment() => count.value++;
}
