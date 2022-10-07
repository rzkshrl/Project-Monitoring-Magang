import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailAttendanceHRController extends GetxController {
  //TODO: Implement DetailAttendanceHRController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamDataPresenceUser(
      String uid) async* {
    yield* firestore
        .collection("Users")
        .doc(uid)
        .collection("Presence")
        .orderBy("todayDate")
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
