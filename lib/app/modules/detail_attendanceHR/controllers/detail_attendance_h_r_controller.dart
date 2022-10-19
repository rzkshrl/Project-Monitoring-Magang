import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailAttendanceHRController extends GetxController {
  //TODO: Implement DetailAttendanceHRController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DateTime? start;
  DateTime end = DateTime.now();

  Future<QuerySnapshot<Map<String, dynamic>>> getDataPresenceUser(
      String uid) async {
    if (start == null) {
      return await firestore
          .collection("Users")
          .doc(uid)
          .collection("Presence")
          .where("todayDate", isLessThan: end.toIso8601String())
          .orderBy("todayDate", descending: true)
          .get();
    } else {
      return await firestore
          .collection("Users")
          .doc(uid)
          .collection("Presence")
          .where("todayDate", isGreaterThan: start!.toIso8601String())
          .where("todayDate",
              isLessThan: end.add(Duration(days: 1)).toIso8601String())
          .orderBy("todayDate", descending: true)
          .get();
    }
  }

  void pickRangeDate(DateTime pickStart, DateTime pickEnd) {
    start = pickStart;
    end = pickEnd;
    update();
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
