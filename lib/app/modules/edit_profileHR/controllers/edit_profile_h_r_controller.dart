import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_magang/app/controller/auth_controller.dart';

class EditProfileHRController extends GetxController {
  //TODO: Implement EditProfileHRController
  FirebaseAuth auth = FirebaseAuth.instance;

  final namaKey = GlobalKey<FormState>().obs;
  final divisiKey = GlobalKey<FormState>().obs;
  final nomorIndukKey = GlobalKey<FormState>().obs;
  final authC = Get.put(AuthController());

  late TextEditingController nameC = TextEditingController();
  late TextEditingController divisiC = TextEditingController();
  late var divisiCon = "".obs;
  setDivisi(String divisi) {
    divisiCon.value = divisi;
    // log(divisiCon.value);
  }

  late TextEditingController nomorindukC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;

  final ImagePicker picker = ImagePicker();

  Future<DocumentSnapshot<Object?>> getUserDoc() async {
    String uid = auth.currentUser!.uid;
    DocumentReference user = firestore.collection("Users").doc(uid);
    return user.get();
  }

  XFile? image;

  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.name);
      print(image!.name.split(".").last);
      print(image!.path);
    } else {
      print(image);
    }
    update();
  }

  void editProfil(String nama, String divisi, String nomorInduk) async {
    String uid = auth.currentUser!.uid;
    DocumentReference docUsers = firestore.collection("Users").doc(uid);

    try {
      Map<String, dynamic> data = {
        "name": nama,
        "divisi": divisi,
        "nomor_induk": nomorInduk,
      };
      if (image != null) {
        File file = File(image!.path);
        String ext = image!.name.split(".").last;

        await storage.ref('$uid/profile.$ext').putFile(file);
        String urlImage =
            await storage.ref('$uid/profile.$ext').getDownloadURL();

        data.addAll({"profile": urlImage});
      }
      await docUsers.update(data);
      if (divisi != "HR & Legal") {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data, Silahkan login kembali",
          onConfirm: () {
            nameC.clear();
            divisiCon.close();
            nomorindukC.clear();
            authC.logout();
          },
          textConfirm: "Okay",
        );
      } else if (divisi == "HR & Legal") {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data, Silahkan login kembali",
          onConfirm: () {
            nameC.clear();
            divisiCon.close();
            nomorindukC.clear();
            authC.logout();
          },
          textConfirm: "Okay",
        );
      } else {
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
    nameC = TextEditingController();
    setDivisi(String divisi) {
      divisiCon.value = divisi;
      // log(divisiCon.value);
    }

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
    divisiCon.close();
    nomorindukC.dispose();

    super.onClose();
  }

  void increment() => count.value++;
}
