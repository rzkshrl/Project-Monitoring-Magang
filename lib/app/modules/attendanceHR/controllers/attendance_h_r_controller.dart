import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceHRController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final authC = Get.put(AuthController());

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return {
        "message":
            "Layanan lokasi GPS dimatikan, tidak dapat mendapatkan lokasi device",
        "error": true
      };
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return {"message": "Izin lokasi ditolak.", "error": true};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return {
        "message":
            "Izin lokasi ditolak secara permanen, ubah permintaan izin lokasi pada device.",
        "error": true
      };
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    return {
      "position": position,
      "message": "Berhasil mendapatkan lokasi device.",
      "error": false
    };
  }

  void getLokasi() async {
    Map<String, dynamic> dataResponse = await determinePosition();
    if (!dataResponse["error"]) {
      Position position = dataResponse['position'];
      // log("${position.latitude} , ${position.latitude}");
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String address =
          "${placemarks[0].street}, \n${placemarks[0].subLocality}, ${placemarks[0].locality}, \n${placemarks[0].subAdministrativeArea}, \n${placemarks[0].administrativeArea}, ${placemarks[0].country}";
      Get.defaultDialog(
          title: dataResponse["message"], middleText: "${address}");
      await updateLokasi(position, address);
    } else {
      Get.defaultDialog(title: "Error", middleText: dataResponse["message"]);
    }
  }

  Future<void> updateLokasi(Position position, String address) async {
    String uid = auth.currentUser!.uid;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    firestore.collection("Users").doc(uid).update({
      "position": {"lat": position.latitude, "long": position.longitude},
      "address": address,
      "detailAddress": {
        "street": placemarks[0].street,
        "subLocality": placemarks[0].subLocality,
        "locality": placemarks[0].locality,
        "subAdministrativeArea": placemarks[0].subAdministrativeArea,
        "administrativeArea": placemarks[0].administrativeArea,
        "country": placemarks[0].country,
        "postalCode": placemarks[0].postalCode
      }
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("Users").doc(uid).snapshots();
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
