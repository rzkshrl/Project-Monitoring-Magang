import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListAttendanceHRController extends GetxController {
  //TODO: Implement ListAttendanceHRController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataUsers() {
    CollectionReference pemasukan = firestore.collection("Users");
    return pemasukan.snapshots();
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
