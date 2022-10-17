import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:project_magang/app/controller/auth_controller.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/routes/app_pages.dart';
import 'package:project_magang/app/utils/loading.dart';
import 'package:project_magang/app/utils/menu_item.dart';
import 'package:project_magang/app/utils/menu_item_att.dart';

import '../../../theme/theme.dart';
import '../../list_attendanceHR/views/list_attendance_h_r_view.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  AttendanceView({Key? key}) : super(key: key);
  final locDef = LatLng(0, 0);

  final AttendanceController controller = Get.put(AttendanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return LoadingView();
            }
            if (snap.hasData) {
              Map<String, dynamic> user = snap.data!.data()!;
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
                          height: bodyHeight * 0.08,
                        ),
                        Container(
                          height: bodyHeight * 0.4,
                          width: bodyWidth * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlutterMap(
                            options: MapOptions(
                                zoom: 17.8,
                                maxZoom: 19.2,
                                interactiveFlags: InteractiveFlag.pinchZoom,
                                keepAlive: true),
                            children: [
                              TileLayer(
                                tileSize: 256.0,
                                urlTemplate:
                                    'http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}',
                                subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                                maxZoom: 22,
                              ),
                              CurrentLocationLayer(
                                  centerOnLocationUpdate:
                                      CenterOnLocationUpdate.always,
                                  positionStream:
                                      LocationMarkerDataStreamFactory()
                                          .geolocatorPositionStream(
                                    stream: controller.streamGetPosition(),
                                  )), // <-- add layer here
                            ],
                          ),
                        ),
                        SizedBox(
                          height: bodyHeight * 0.04,
                        ),
                        Container(
                          height: bodyHeight * 0.38,
                          width: bodyWidth * 1,
                          padding: EdgeInsets.only(
                              left: bodyWidth * 0.06,
                              right: bodyWidth * 0.06,
                              top: bodyHeight * 0.03),
                          decoration: BoxDecoration(
                              color: Yellow1,
                              borderRadius: BorderRadius.circular(22)),
                          child: StreamBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                              stream: controller.streamTodayPresenceUser(),
                              builder: (context, snapToday) {
                                if (snap.connectionState ==
                                    ConnectionState.waiting) {
                                  return LoadingView();
                                }
                                Map<String, dynamic>? dataToday =
                                    snapToday.data?.data();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lokasi terakhir",
                                      textAlign: TextAlign.start,
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.02,
                                    ),
                                    Text(
                                      user['detailAddress'] != null
                                          ? "${user['detailAddress']['street']}, ${user['detailAddress']['subLocality']}, ${user['detailAddress']['locality']}, ${user['detailAddress']['subAdministrativeArea']}, \n${user['detailAddress']['administrativeArea']}, ${user['detailAddress']['country']}, ${user['detailAddress']['postalCode']},"
                                          : "Belum mendapatkan lokasi.",
                                      textAlign: TextAlign.start,
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                        color: Grey2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Masuk",
                                          textAlign: TextAlign.start,
                                          textScaleFactor: 1.1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "Keluar",
                                          textAlign: TextAlign.start,
                                          textScaleFactor: 1.1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.01,
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dataToday?["masuk"] == null
                                                ? "--:--"
                                                : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['masuk']['date']))}",
                                            textAlign: TextAlign.start,
                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                              color: Grey2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: bodyWidth * 0.3,
                                          // ),
                                          Text(
                                            dataToday?["keluar"] == null
                                                ? "--:--"
                                                : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['keluar']['date']))}",
                                            textAlign: TextAlign.start,
                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                              color: Grey2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.02,
                                    ),
                                    Container(
                                      width: bodyWidth * 1,
                                      height: bodyHeight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Blue1,
                                      ),
                                      child: StreamBuilder<
                                              DocumentSnapshot<
                                                  Map<String, dynamic>>>(
                                          stream: controller
                                              .streamTodayPresenceUser(),
                                          builder: (context, snapBtn) {
                                            if (snap.connectionState ==
                                                ConnectionState.waiting) {
                                              return LoadingView();
                                            }
                                            Map<String, dynamic>? dataToday =
                                                snapBtn.data?.data();
                                            return TextButton(
                                              onPressed: () {
                                                controller.getLokasi();
                                              },
                                              /*authC.logut(emailC.text, passC.text)*/
                                              child: Text(
                                                dataToday?["masuk"] == null
                                                    ? "Masuk"
                                                    : "Keluar",
                                                textScaleFactor: 1.1,
                                                style: headingBtn.copyWith(
                                                    color: dataToday?[
                                                                "keluar"] !=
                                                            null
                                                        ? Yellow1.withOpacity(
                                                            0.5)
                                                        : Yellow1),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return LoadingView();
            }
          }),
    );
  }
}
