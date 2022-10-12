import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:project_magang/app/theme/theme.dart';

class AttendanceController extends GetxController {
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
      await updateLokasi(position, address);
      await absensi(position, address);
    } else {
      Get.defaultDialog(title: "Error", middleText: dataResponse["message"]);
    }
  }

  Future<void> absensi(Position position, String address) async {
    String uid = auth.currentUser!.uid;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    CollectionReference<Map<String, dynamic>> colPresence =
        await firestore.collection("Users").doc(uid).collection('Presence');
    QuerySnapshot<Map<String, dynamic>> snapPresence = await colPresence.get();

    DateTime now = DateTime.now();
    String todayID = DateFormat.yMd().format(now).replaceAll("/", "-");
    if (snapPresence.docs.length == 0) {
      //belum pernah absen dan method absen masuk
      await colPresence.doc(todayID).set({
        "todayDate": now.toIso8601String(),
        "uid": uid,
        "masuk": {
          "date": now.toIso8601String(),
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
        },
      });
      Get.dialog(Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Yellow1,
        child: Container(
          width: 300,
          height: 210,
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Icon(
                IconlyLight.tick_square,
                color: Blue1,
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Absensi Sudah Terpenuhi',
                style: TextStyle(
                    color: Blue1, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Selamat dan Semangat Bekerja!!',
                style: TextStyle(
                    color: Blue1, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ));
    } else {
      //sudah pernah absen
      DocumentSnapshot<Map<String, dynamic>> todayDocs =
          await colPresence.doc(todayID).get();
      //cek kondisi absen -> sudah pernah / belum?
      if (todayDocs.exists == true) {
        //absen keluar / sudah keduanya
        Map<String, dynamic>? dataPresenceToday = todayDocs.data();
        if (dataPresenceToday?['keluar'] != null) {
          //sudah absen masuk & keluar
          Get.dialog(Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Yellow1,
            child: Container(
              width: 300,
              height: 210,
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Icon(
                    IconlyLight.tick_square,
                    color: Blue1,
                    size: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Absensi Sudah Terpenuhi',
                    style: TextStyle(
                        color: Blue1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Selamat dan Semangat Bekerja!!',
                    style: TextStyle(
                        color: Blue1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ));
        } else {
          //absen keluar
          await colPresence.doc(todayID).update({
            "keluar": {
              "date": now.toIso8601String(),
              "position": {
                "lat": position.latitude,
                "long": position.longitude
              },
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
            },
          });
          Get.dialog(Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Yellow1,
            child: Container(
              width: 300,
              height: 210,
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Icon(
                    IconlyLight.tick_square,
                    color: Blue1,
                    size: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sukses Absensi Keluar',
                    style: TextStyle(
                        color: Blue1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sampai Jumpa Besok Pagi Dengan Semangat Kerja Baru',
                    style: TextStyle(
                        color: Blue1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ));
        }
      } else {
        //absen masuk dahulu
        await colPresence.doc(todayID).set({
          "todayDate": now.toIso8601String(),
          "uid": uid,
          "masuk": {
            "date": now.toIso8601String(),
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
          },
        });
        Get.defaultDialog(
            title: "Sukses", middleText: "Berhasil melakukan Absensi Masuk");
      }
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

  Stream<DocumentSnapshot<Map<String, dynamic>>>
      streamTodayPresenceUser() async* {
    String uid = auth.currentUser!.uid;
    String todayID =
        DateFormat.yMd().format(DateTime.now()).replaceAll("/", "-");

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
