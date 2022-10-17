import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
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

  final LocationMarkerPosition currentPosition = LocationMarkerPosition(
    latitude: 0,
    longitude: 0,
    accuracy: 0,
  );
  final LocationMarkerHeading currentHeading = LocationMarkerHeading(
    heading: 2,
    accuracy: 0.2,
  );

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
