import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../theme/theme.dart';
import '../../../utils/loading.dart';
import '../controllers/detail_location_per_date_controller.dart';

class DetailLocationPerDateView
    extends GetView<DetailLocationPerDateController> {
  DetailLocationPerDateView({Key? key}) : super(key: key);
  final DetailLocationPerDateController controller =
      Get.put(DetailLocationPerDateController());

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments[0];
    final User = Get.arguments[1];
    log("${user}");
    var uid = user['uid'];
    var todayDate = user['todayDate'];
    var nama = User['name'];
    var profile = User['profile'];
    var defaultImage =
        "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamTodayLocationUser(uid, todayDate),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return LoadingView();
            }
            Map<String, dynamic>? dataToday = snap.data?.data();
            var latUserMasuk = dataToday?['masuk']['position']['lat'];
            var longUserMasuk = dataToday?['masuk']['position']['long'];
            var latUserKeluar = dataToday?['keluar']['position']['lat'];
            var longUserKeluar = dataToday?['keluar']['position']['long'];
            return LayoutBuilder(
              builder: (context, constraints) {
                final textScale = MediaQuery.of(context).textScaleFactor;
                final bodyHeight = MediaQuery.of(context).size.height;
                -MediaQuery.of(context).padding.top;
                final bodyWidth = MediaQuery.of(context).size.width;
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: bodyWidth * 0.05,
                    right: bodyWidth * 0.05,
                    bottom: bodyHeight * 0.02,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: bodyHeight * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: dark,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: bodyHeight * 0.01,
                      ),
                      Container(
                        height: bodyHeight * 0.35,
                        width: bodyWidth * 1,
                        decoration: BoxDecoration(
                          color: Grey1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: dataToday?['masuk'] != null
                            ? FlutterMap(
                                options: MapOptions(
                                  center: LatLng(latUserMasuk, longUserMasuk),
                                  zoom: 19,
                                  maxZoom: 19.5,
                                  interactiveFlags: InteractiveFlag.pinchZoom,
                                ),
                                children: [
                                  TileLayer(
                                    tileSize: 256.0,
                                    urlTemplate:
                                        'http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}',
                                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                                    maxZoom: 22,
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        width: 42,
                                        height: 42,
                                        point:
                                            LatLng(latUserMasuk, longUserMasuk),
                                        builder: (context) => ClipOval(
                                          child: Container(
                                            color: Colors.grey.shade200,
                                            child: Image.network(
                                              profile != null
                                                  ? profile != ""
                                                      ? profile
                                                      : defaultImage
                                                  : defaultImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Center(
                                child: Text(
                                "Belum ada data",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.15,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                      ),
                      SizedBox(
                        height: bodyHeight * 0.03,
                      ),
                      Container(
                          height: bodyHeight * 0.2,
                          width: bodyWidth * 1,
                          padding: EdgeInsets.only(
                              left: bodyWidth * 0.06,
                              right: bodyWidth * 0.06,
                              top: bodyHeight * 0.03),
                          decoration: BoxDecoration(
                              color: Yellow1,
                              borderRadius: BorderRadius.circular(22)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.location,
                                    color: dark,
                                  ),
                                  SizedBox(
                                    width: bodyWidth * 0.02,
                                  ),
                                  Text(
                                    "Lokasi Awal",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: bodyHeight * 0.02,
                              ),
                              Text(
                                dataToday?['masuk'] != null
                                    ? "${dataToday?['masuk']['detailAddress']['street']}, ${dataToday?['masuk']['detailAddress']['subLocality']}, ${dataToday?['masuk']['detailAddress']['locality']}, ${dataToday?['masuk']['detailAddress']['subAdministrativeArea']}, \n${dataToday?['masuk']['detailAddress']['administrativeArea']}, ${dataToday?['masuk']['detailAddress']['country']}, ${dataToday?['masuk']['detailAddress']['postalCode']},"
                                    : "--",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  color: Grey2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: bodyHeight * 0.03,
                      ),
                      Container(
                        height: bodyHeight * 0.35,
                        width: bodyWidth * 1,
                        decoration: BoxDecoration(
                          color: Grey1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: dataToday?['keluar'] != null
                            ? FlutterMap(
                                options: MapOptions(
                                  center: LatLng(latUserKeluar, longUserKeluar),
                                  zoom: 19,
                                  maxZoom: 19.5,
                                  interactiveFlags: InteractiveFlag.pinchZoom,
                                ),
                                children: [
                                  TileLayer(
                                    tileSize: 256.0,
                                    urlTemplate:
                                        'http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}',
                                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                                    maxZoom: 22,
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        width: 42,
                                        height: 42,
                                        point: LatLng(
                                            latUserKeluar, longUserKeluar),
                                        builder: (context) => ClipOval(
                                          child: Container(
                                            color: Colors.grey.shade200,
                                            child: Image.network(
                                              profile != null
                                                  ? profile != ""
                                                      ? profile
                                                      : defaultImage
                                                  : defaultImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Center(
                                child: Text(
                                "Belum ada data",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.15,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                      ),
                      SizedBox(
                        height: bodyHeight * 0.03,
                      ),
                      Container(
                        height: bodyHeight * 0.2,
                        width: bodyWidth * 1,
                        padding: EdgeInsets.only(
                            left: bodyWidth * 0.06,
                            right: bodyWidth * 0.06,
                            top: bodyHeight * 0.03),
                        decoration: BoxDecoration(
                            color: Yellow1,
                            borderRadius: BorderRadius.circular(22)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  IconlyLight.location,
                                  color: dark,
                                ),
                                SizedBox(
                                  width: bodyWidth * 0.02,
                                ),
                                Text(
                                  "Lokasi Akhir",
                                  textAlign: TextAlign.start,
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: bodyHeight * 0.02,
                            ),
                            Text(
                              dataToday?['keluar'] != null
                                  ? "${dataToday?['keluar']['detailAddress']['street']}, ${dataToday?['keluar']['detailAddress']['subLocality']}, ${dataToday?['keluar']['detailAddress']['locality']}, ${dataToday?['keluar']['detailAddress']['subAdministrativeArea']}, \n${dataToday?['keluar']['detailAddress']['administrativeArea']}, ${dataToday?['keluar']['detailAddress']['country']}, ${dataToday?['keluar']['detailAddress']['postalCode']},"
                                  : "--",
                              textAlign: TextAlign.start,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: Grey2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
