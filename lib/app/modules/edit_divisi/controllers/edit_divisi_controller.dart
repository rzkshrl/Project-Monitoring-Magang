import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';

class EditDivisiController extends GetxController {
  //TODO: Implement EditDivisiController

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.put(AuthController());

  Future<DocumentSnapshot<Object?>> getUserDoc() async {
    String uid = auth.currentUser!.uid;
    DocumentReference user = firestore.collection("Users").doc(uid);
    return user.get();
  }

  final divisiKey = GlobalKey<FormState>().obs;

  late TextEditingController divisiC = TextEditingController();
  late var divisiCon = "".obs;
  void setDivisi(String divisi) {
    divisiCon.value = divisi;
    // log(divisiCon.value);
  }

  void editProfil(String divisi) async {
    String uid = auth.currentUser!.uid;
    DocumentReference docUsers = firestore.collection("Users").doc(uid);

    try {
      await docUsers.update({
        "divisi": divisi,
      });

      if (divisi != "HR & Legal") {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data, Silahkan login kembali",
          onConfirm: () {
            divisiCon.close();

            authC.logout();
          },
          textConfirm: "Okay",
        );
      } else if (divisi == "HR & Legal") {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data, Silahkan login kembali",
          onConfirm: () {
            divisiCon.close();

            authC.logout();
          },
          textConfirm: "Okay",
        );
      } else {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data",
          onConfirm: () {
            divisiCon.close();

            Get.back();
            Get.back();
          },
          textConfirm: "Okay",
        );
      }
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
    setDivisi(String divisi) {
      divisiCon.value = divisi;
    }

    ;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    divisiCon.close();

    super.onClose();
  }
}
