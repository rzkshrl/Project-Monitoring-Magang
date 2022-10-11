import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLocationPerDateController extends GetxController {
  //TODO: Implement DetailLocationPerDateController

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamTodayLocationUser(
      String uid, String todayDate) async* {
    String todayID =
        DateFormat.yMd().format(DateTime.parse(todayDate)).replaceAll("/", "-");

    yield* firestore
        .collection("Users")
        .doc(uid)
        .collection("Presence")
        .doc(todayID)
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
