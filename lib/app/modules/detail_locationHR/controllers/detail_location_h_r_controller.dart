import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLocationHRController extends GetxController {
  //TODO: Implement DetailLocationHRController

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamDataLocationUser(
      String uid) async* {
    yield* firestore
        .collection("Users")
        .doc(uid)
        .collection("Presence")
        .orderBy("todayDate", descending: true)
        .snapshots();
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
}
