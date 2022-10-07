import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38,
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
                                      height: bodyHeight * 0.18,
                                      width: bodyWidth,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Blue1.withOpacity(0.5)),
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        bottom: bodyHeight * 0.02,
                                        top: bodyHeight * 0.03,
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
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "$nomorInduk",
                                            textAlign: TextAlign.start,
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.025,
                                    ),
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
                                              color: Yellow1.withOpacity(0.5)),
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
                                                "Check In",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.6,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: bodyHeight * 0.025,
                                              ),
                                              Text(
                                                "19 Juni 2022",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "08.15",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
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
                                              color: Yellow1.withOpacity(0.5)),
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
                                                "Check Out",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.6,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: bodyHeight * 0.025,
                                              ),
                                              Text(
                                                "19 Juni 2022",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "16.35",
                                                textAlign: TextAlign.start,
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
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
                                    Container(
                                      height: bodyHeight * 0.14,
                                      width: bodyWidth,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Yellow1.withOpacity(0.5)),
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.06,
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
                                            "08.20.16",
                                            textAlign: TextAlign.start,
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                        height: bodyHeight * 0.18,
                                        width: bodyWidth,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Blue1.withOpacity(0.5)),
                                        padding: EdgeInsets.only(
                                          left: bodyWidth * 0.06,
                                          right: bodyWidth * 0.06,
                                          bottom: bodyHeight * 0.02,
                                          top: bodyHeight * 0.03,
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
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "$nomorInduk",
                                              textAlign: TextAlign.start,
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: bodyHeight * 0.05,
                                      ),
                                      Container(
                                        height: bodyHeight * 0.48,
                                        width: bodyWidth,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Yellow1.withOpacity(0.5)),
                                        padding: EdgeInsets.only(
                                          left: bodyWidth * 0.03,
                                          right: bodyWidth * 0.03,
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
                                              "Karyawan Aktif",
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
                                              "45 Karyawan Melakukan Absensi",
                                              textAlign: TextAlign.start,
                                              textScaleFactor: 1.5,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
