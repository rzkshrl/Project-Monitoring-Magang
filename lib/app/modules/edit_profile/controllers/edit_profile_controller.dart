import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';

import '../../../controller/auth_controller.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  FirebaseAuth auth = FirebaseAuth.instance;

  final namaKey = GlobalKey<FormState>().obs;

  final nomorIndukKey = GlobalKey<FormState>().obs;
  final authC = Get.put(AuthController());

  late TextEditingController nameC = TextEditingController();

  late TextEditingController nomorindukC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getUserDoc() async {
    String uid = auth.currentUser!.uid;
    DocumentReference user = firestore.collection("Users").doc(uid);
    return user.get();
  }

  void editProfil(String nama, String nomorInduk) async {
    String uid = auth.currentUser!.uid;
    DocumentReference docUsers = firestore.collection("Users").doc(uid);

    try {
      await docUsers.update({
        "name": nama,
        "nomor_induk": nomorInduk,
      });
      await auth.currentUser?.updateDisplayName(nama);

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data",
        onConfirm: () {
          nameC.clear();
          nomorindukC.clear();
          Get.to(HomeView());
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
    nomorindukC.dispose();
    super.onClose();
  }
}
