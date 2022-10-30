import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:project_magang/app/theme/theme.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/loading.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: light,
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: controller.getUserDoc(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return LoadingView();
              }
              if (snap.hasData) {
                var nama = snap.data!.get("name");
                var divisi = snap.data!.get("divisi");
                var nomorInduk = snap.data!.get("nomor_induk");
                var role = snap.data!.get("divisi");
                var profile = snap.data!.get("profile");

                var defaultImage =
                    "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
                if (role != "HR & Legal") {
                  return LayoutBuilder(builder: (context, constraints) {
                    final textScale = MediaQuery.of(context).textScaleFactor;

                    final bodyHeight = MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top;
                    final bodyWidth = MediaQuery.of(context).size.width;
                    return SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: bodyWidth * 0.05,
                        right: bodyWidth * 0.05,
                        bottom: bodyHeight * 0.01,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: bodyHeight * 0.07,
                          ),
                          Column(
                            children: [
                              ClipOval(
                                child: Container(
                                  width: bodyWidth * 0.38,
                                  height: bodyHeight * 0.18,
                                  color: Colors.grey.shade200,
                                  // child: Center(child: Text("X")),
                                  child: Image.network(
                                    snap.data!.get("profile") != null
                                        ? snap.data!.get("profile") != ""
                                            ? snap.data!.get("profile")
                                            : defaultImage
                                        : defaultImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: bodyHeight * 0.025,
                              ),
                              Container(
                                height: 0.38.sw,
                                width: bodyWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Blue1.withOpacity(0.5)),
                                padding: EdgeInsets.only(
                                  left: bodyWidth * 0.06,
                                  right: bodyWidth * 0.06,
                                  bottom: bodyHeight * 0.02,
                                  top: bodyHeight * 0.03,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(
                                      "$nama",
                                      textAlign: TextAlign.start,
                                      textScaleFactor: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.02,
                                    ),
                                    Text(
                                      "$divisi",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: ScreenUtil().setSp(23),
                                      ),
                                    ),
                                    Text(
                                      "$nomorInduk",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: ScreenUtil().setSp(23)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: bodyHeight * 0.025,
                              ),
                              StreamBuilder<
                                      DocumentSnapshot<Map<String, dynamic>>>(
                                  stream: controller.streamTodayPresenceUser(),
                                  builder: (context, snapToday) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return LoadingView();
                                    }
                                    Map<String, dynamic>? dataToday =
                                        snapToday.data?.data();

                                    var checkOutTime =
                                        dataToday?["keluar"] == null
                                            ? DateTime.now()
                                            : DateTime.parse(
                                                dataToday?['keluar']['date']);

                                    var checkInTime =
                                        dataToday?["masuk"] == null
                                            ? DateTime.now()
                                            : DateTime.parse(
                                                dataToday?['masuk']['date']);

                                    var hours = checkOutTime
                                        .difference(checkInTime)
                                        .inHours;

                                    var minutes = checkOutTime
                                        .difference(checkInTime)
                                        .inMinutes;

                                    var totalWorkingHours =
                                        '$hours jam ${minutes % 60} menit';

                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: bodyHeight * 0.34,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      Yellow1.withOpacity(0.5)),
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                bottom: bodyHeight * 0.02,
                                                top: bodyHeight * 0.03,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Masuk",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.6,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: bodyHeight * 0.025,
                                                  ),
                                                  Text(
                                                    dataToday?["masuk"] == null
                                                        ? "Belum Absen Masuk"
                                                        : "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(dataToday?['masuk']['date']))}",
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.3,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: bodyHeight * 0.01,
                                                  ),
                                                  Text(
                                                    dataToday?["masuk"] == null
                                                        ? ""
                                                        : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['masuk']['date']))}",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.3,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                            ),
                                            Container(
                                              height: bodyHeight * 0.34,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      Yellow1.withOpacity(0.5)),
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                bottom: bodyHeight * 0.02,
                                                top: bodyHeight * 0.03,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Keluar",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.6,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: bodyHeight * 0.025,
                                                  ),
                                                  Text(
                                                    dataToday?["keluar"] == null
                                                        ? "Belum Absen Keluar"
                                                        : "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(dataToday?['keluar']['date']))}",
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.3,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: bodyHeight * 0.01,
                                                  ),
                                                  Text(
                                                    dataToday?["keluar"] == null
                                                        ? ""
                                                        : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['keluar']['date']))}",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.3,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: bodyHeight * 0.025,
                                        ),
                                        Builder(builder: (context) {
                                          if (dataToday?["masuk"] == null ||
                                              dataToday?["keluar"] == null) {
                                            return Container(
                                              height: bodyHeight * 0.14,
                                              width: bodyWidth,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      Yellow1.withOpacity(0.5)),
                                              padding: EdgeInsets.only(
                                                left: bodyWidth * 0.06,
                                                right: bodyWidth * 0.06,
                                                bottom: bodyHeight * 0.02,
                                                top: bodyHeight * 0.01,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total Jam Kerja",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.6,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: bodyHeight * 0.01,
                                                  ),
                                                  Text(
                                                    "Belum Melengkapi Absensi",
                                                    textAlign: TextAlign.start,
                                                    textScaleFactor: 1.3,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                          return Container(
                                            height: bodyHeight * 0.14,
                                            width: bodyWidth,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color:
                                                    Yellow1.withOpacity(0.5)),
                                            padding: EdgeInsets.only(
                                              left: bodyWidth * 0.06,
                                              right: bodyWidth * 0.06,
                                              bottom: bodyHeight * 0.02,
                                              top: bodyHeight * 0.01,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Total Jam Kerja",
                                                  textAlign: TextAlign.start,
                                                  textScaleFactor: 1.6,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: bodyHeight * 0.01,
                                                ),
                                                Text(
                                                  totalWorkingHours,
                                                  textAlign: TextAlign.start,
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: bodyWidth * 0.03,
                              right: bodyWidth * 0.03,
                              // bottom: bodyHeight * 0.01,
                              top: bodyHeight * 0.03,
                            ),
                            child: Text(
                              "Absensi 5 hari terakhir",
                              textAlign: TextAlign.end,
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: controller.streamDataLastPresenceUser(),
                              builder: (context, snapPresence) {
                                if (snapPresence.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: backgroundBlue,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                        bottom: bodyHeight * 0.002,
                                        top: bodyHeight * 0.03),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapPresence.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          snapPresence.data!.docs[index].data();
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: bodyHeight * 0.015),
                                        child: Material(
                                          color: Yellow1,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: InkWell(
                                            onTap: () {},
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: SizedBox(
                                              width: bodyWidth * 1,
                                              height: bodyHeight * 0.1,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: bodyWidth * 0.06,
                                                        left: bodyWidth * 0.06),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "Masuk",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  textScaleFactor:
                                                                      1.15,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      bodyHeight *
                                                                          0.005,
                                                                ),
                                                                Text(
                                                                  "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(data['masuk']['date']))}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  textScaleFactor:
                                                                      1,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: bodyWidth *
                                                                  0.1,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "Keluar",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  textScaleFactor:
                                                                      1.15,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      bodyHeight *
                                                                          0.005,
                                                                ),
                                                                Text(
                                                                  data["keluar"] !=
                                                                          null
                                                                      ? "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(data['keluar']['date']))}"
                                                                      : "--",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  textScaleFactor:
                                                                      1,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(data['masuk']['date']))}",
                                                          textScaleFactor: 0.9,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom *
                                          0.4))
                        ],
                      ),
                    );
                  });
                } else {
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
                          bottom: bodyHeight * 0.01,
                        ),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: bodyHeight * 0.07,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          width: bodyWidth * 0.38,
                                          height: bodyHeight * 0.18,
                                          color: Colors.grey.shade200,
                                          // child: Center(child: Text("X")),
                                          child: Image.network(
                                            snap.data!.get("profile") != null
                                                ? snap.data!.get("profile") !=
                                                        ""
                                                    ? snap.data!.get("profile")
                                                    : defaultImage
                                                : defaultImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: bodyHeight * 0.025,
                                      ),
                                      Container(
                                        height: 0.3.sh,
                                        width: bodyWidth.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Blue1.withOpacity(0.5)),
                                        padding: EdgeInsets.only(
                                          left: bodyWidth * 0.06.w,
                                          right: bodyWidth * 0.06.w,
                                          bottom: bodyHeight * 0.02.h,
                                          top: bodyHeight * 0.03.h,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // ignore: prefer_const_constructors
                                            Text(
                                              "$nama",
                                              textAlign: TextAlign.start,
                                              textScaleFactor: 2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: bodyHeight * 0.02,
                                            ),
                                            Text(
                                              "$divisi",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 23.sp),
                                            ),
                                            Text(
                                              "$nomorInduk",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 23.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: bodyHeight * 0.03,
                                      ),
                                      StreamBuilder<
                                              DocumentSnapshot<
                                                  Map<String, dynamic>>>(
                                          stream: controller
                                              .streamTodayPresenceUser(),
                                          builder: (context, snapToday) {
                                            if (snap.connectionState ==
                                                ConnectionState.waiting) {
                                              return LoadingView();
                                            }
                                            Map<String, dynamic>? dataToday =
                                                snapToday.data?.data();

                                            var checkOutTime =
                                                dataToday?["keluar"] == null
                                                    ? DateTime.now()
                                                    : DateTime.parse(
                                                        dataToday?['keluar']
                                                            ['date']);

                                            var checkInTime =
                                                dataToday?["masuk"] == null
                                                    ? DateTime.now()
                                                    : DateTime.parse(
                                                        dataToday?['masuk']
                                                            ['date']);

                                            var hours = checkOutTime
                                                .difference(checkInTime)
                                                .inHours;

                                            var minutes = checkOutTime
                                                .difference(checkInTime)
                                                .inMinutes;

                                            var totalWorkingHours =
                                                '$hours jam ${minutes % 60} menit';

                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: bodyHeight * 0.34,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.42,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Yellow1
                                                              .withOpacity(
                                                                  0.5)),
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                        right: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                        bottom:
                                                            bodyHeight * 0.02,
                                                        top: bodyHeight * 0.03,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Masuk",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.6,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: bodyHeight *
                                                                0.025,
                                                          ),
                                                          Text(
                                                            dataToday?["masuk"] ==
                                                                    null
                                                                ? "Belum Absen Masuk"
                                                                : "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(dataToday?['masuk']['date']))}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: bodyHeight *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            dataToday?["masuk"] ==
                                                                    null
                                                                ? ""
                                                                : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['masuk']['date']))}",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.06,
                                                    ),
                                                    Container(
                                                      height: bodyHeight * 0.34,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.42,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Yellow1
                                                              .withOpacity(
                                                                  0.5)),
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                        right: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                        bottom:
                                                            bodyHeight * 0.02,
                                                        top: bodyHeight * 0.03,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Keluar",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.6,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: bodyHeight *
                                                                0.025,
                                                          ),
                                                          Text(
                                                            dataToday?["keluar"] ==
                                                                    null
                                                                ? "Belum Absen Keluar"
                                                                : "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(dataToday?['keluar']['date']))}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: bodyHeight *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            dataToday?["keluar"] ==
                                                                    null
                                                                ? ""
                                                                : "${DateFormat('HH:mm', 'id-ID').format(DateTime.parse(dataToday?['keluar']['date']))}",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: bodyHeight * 0.025,
                                                ),
                                                Builder(builder: (context) {
                                                  if (dataToday?["masuk"] ==
                                                          null ||
                                                      dataToday?["keluar"] ==
                                                          null) {
                                                    return Container(
                                                      height: bodyHeight * 0.14,
                                                      width: bodyWidth,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Yellow1
                                                              .withOpacity(
                                                                  0.5)),
                                                      padding: EdgeInsets.only(
                                                        left: bodyWidth * 0.06,
                                                        right: bodyWidth * 0.06,
                                                        bottom:
                                                            bodyHeight * 0.02,
                                                        top: bodyHeight * 0.01,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Total Jam Kerja",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.6,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: bodyHeight *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "Belum Melengkapi Absensi",
                                                            textAlign:
                                                                TextAlign.start,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                  return Container(
                                                    height: bodyHeight * 0.14,
                                                    width: bodyWidth,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color:
                                                            Yellow1.withOpacity(
                                                                0.5)),
                                                    padding: EdgeInsets.only(
                                                      left: bodyWidth * 0.06,
                                                      right: bodyWidth * 0.06,
                                                      bottom: bodyHeight * 0.02,
                                                      top: bodyHeight * 0.01,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Total Jam Kerja",
                                                          textAlign:
                                                              TextAlign.start,
                                                          textScaleFactor: 1.6,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              bodyHeight * 0.01,
                                                        ),
                                                        Text(
                                                          totalWorkingHours,
                                                          textAlign:
                                                              TextAlign.start,
                                                          textScaleFactor: 1.5,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              ],
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom *
                                            0.4))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              } else {
                return LoadingView();
              }
            }));
  }
}
