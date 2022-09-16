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
  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    log("$user");
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    final DashboardController controller = Get.put(DashboardController());

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
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
                var nomor_induk = snap.data!.get("nomor_induk");
                String defaultImage =
                    "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    reverse: true,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      height: bodyHeight * 0.18,
                                      color: Colors.grey.shade200,
                                      child: Center(
                                        child: Image.network(
                                          snap.data!.get("profile") != null
                                              ? snap.data!.get("profile") != ""
                                                  ? snap.data!.get("profile")
                                                  : defaultImage
                                              : defaultImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      // child: Image.network(src),
                                    ),
                                  ),
                                  SizedBox(
                                    height: bodyHeight * 0.025,
                                  ),
                                  Container(
                                    height: bodyHeight * 0.18,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Blue1.withOpacity(0.5)),
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.06,
                                      right: MediaQuery.of(context).size.width *
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
                                          "$nomor_induk",
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38,
                                        height: bodyHeight * 0.18,
                                        color: Colors.grey.shade200,
                                        child: Center(child: Text("X")),
                                        // child: Image.network(src),
                                      ),
                                    ),
                                    SizedBox(
                                      height: bodyHeight * 0.025,
                                    ),
                                    Container(
                                      height: bodyHeight * 0.18,
                                      width: MediaQuery.of(context).size.width,
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
                                            "$nomor_induk",
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
                                      width: MediaQuery.of(context).size.width,
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
                  },
                );
              } else {
                return LoadingView();
              }
            }),
      ),
    );

    // return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    //     stream: authC.streamRole(),
    //     builder: (context, snap) {
    //       if (snap.connectionState == ConnectionState.waiting) {
    //         return LoadingView();
    //       }
    //       if (snap.hasData) {
    //         // log("test snapshot" + "${snap.data!.data()}");
    //         // return LoadingView();
    //         var role = snap.data!.data()!["divisi"];
    //         // log("$snap.data" + "data");
    //         if (role == "HR & Legal") {
    //           return AnnotatedRegion(
    //             value: SystemUiOverlayStyle(
    //               statusBarBrightness: Brightness.dark,
    //               statusBarIconBrightness: Brightness.dark,
    //               statusBarColor: light,
    //             ),
    //             child: Scaffold(
    //               resizeToAvoidBottomInset: false,
    //               backgroundColor: light,
    //               body: LayoutBuilder(
    //                 builder: (context, constraints) => SingleChildScrollView(
    //                   reverse: true,
    //                   padding: EdgeInsets.only(
    //                     left: MediaQuery.of(context).size.width * 0.05,
    //                     right: MediaQuery.of(context).size.width * 0.05,
    //                     bottom: bodyHeight * 0.01,
    //                   ),
    //                   child: ConstrainedBox(
    //                     constraints:
    //                         BoxConstraints(minWidth: constraints.maxHeight),
    //                     child: IntrinsicHeight(
    //                       child: Column(
    //                         children: [
    //                           SizedBox(
    //                             height: bodyHeight * 0.07,
    //                           ),
    //                           Container(
    //                             child: Column(
    //                               children: [
    //                                 ClipOval(
    //                                   child: Container(
    //                                     width:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.38,
    //                                     height: bodyHeight * 0.18,
    //                                     color: Colors.grey.shade200,
    //                                     child: Center(child: Text("X")),
    //                                     // child: Image.network(src),
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: bodyHeight * 0.025,
    //                                 ),
    //                                 Container(
    //                                   height: bodyHeight * 0.18,
    //                                   width: MediaQuery.of(context).size.width,
    //                                   decoration: BoxDecoration(
    //                                       borderRadius:
    //                                           BorderRadius.circular(12),
    //                                       color: Blue1.withOpacity(0.5)),
    //                                   padding: EdgeInsets.only(
    //                                     left:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     right:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     bottom: bodyHeight * 0.02,
    //                                     top: bodyHeight * 0.03,
    //                                   ),
    //                                   child: Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     children: [
    //                                       // ignore: prefer_const_constructors
    //                                       Text(
    //                                         "Juna Saputra",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 2,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w700,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         height: bodyHeight * 0.02,
    //                                       ),
    //                                       Text(
    //                                         "Human Resource Development",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                       Text(
    //                                         "134173676713",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: bodyHeight * 0.05,
    //                                 ),
    //                                 Container(
    //                                   height: bodyHeight * 0.48,
    //                                   width: MediaQuery.of(context).size.width,
    //                                   decoration: BoxDecoration(
    //                                       borderRadius:
    //                                           BorderRadius.circular(12),
    //                                       color: Yellow1.withOpacity(0.5)),
    //                                   padding: EdgeInsets.only(
    //                                     left:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.03,
    //                                     right:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.03,
    //                                     bottom: bodyHeight * 0.02,
    //                                     top: bodyHeight * 0.01,
    //                                   ),
    //                                   child: Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.center,
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.center,
    //                                     children: [
    //                                       Text(
    //                                         "Karyawan Aktif",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.6,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w700,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         height: bodyHeight * 0.01,
    //                                       ),
    //                                       Text(
    //                                         "45 Karyawan Melakukan Absensi",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           Padding(
    //                               padding: EdgeInsets.only(
    //                                   bottom: MediaQuery.of(context)
    //                                           .viewInsets
    //                                           .bottom *
    //                                       0.4))
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         } else {
    //           return AnnotatedRegion(
    //             value: SystemUiOverlayStyle(
    //               statusBarBrightness: Brightness.dark,
    //               statusBarIconBrightness: Brightness.dark,
    //               statusBarColor: light,
    //             ),
    //             child: Scaffold(
    //               resizeToAvoidBottomInset: false,
    //               backgroundColor: light,
    //               body: LayoutBuilder(
    //                 builder: (context, constraints) => SingleChildScrollView(
    //                   reverse: true,
    //                   padding: EdgeInsets.only(
    //                     left: MediaQuery.of(context).size.width * 0.05,
    //                     right: MediaQuery.of(context).size.width * 0.05,
    //                     bottom: bodyHeight * 0.01,
    //                   ),
    //                   child: ConstrainedBox(
    //                     constraints:
    //                         BoxConstraints(minWidth: constraints.maxHeight),
    //                     child: IntrinsicHeight(
    //                       child: Column(
    //                         children: [
    //                           SizedBox(
    //                             height: bodyHeight * 0.07,
    //                           ),
    //                           Container(
    //                             child: Column(
    //                               children: [
    //                                 ClipOval(
    //                                   child: Container(
    //                                     width:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.38,
    //                                     height: bodyHeight * 0.18,
    //                                     color: Colors.grey.shade200,
    //                                     child: Center(child: Text("X")),
    //                                     // child: Image.network(src),
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: bodyHeight * 0.025,
    //                                 ),
    //                                 Container(
    //                                   height: bodyHeight * 0.18,
    //                                   width: MediaQuery.of(context).size.width,
    //                                   decoration: BoxDecoration(
    //                                       borderRadius:
    //                                           BorderRadius.circular(12),
    //                                       color: Blue1.withOpacity(0.5)),
    //                                   padding: EdgeInsets.only(
    //                                     left:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     right:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     bottom: bodyHeight * 0.02,
    //                                     top: bodyHeight * 0.03,
    //                                   ),
    //                                   child: Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     children: [
    //                                       // ignore: prefer_const_constructors
    //                                       Text(
    //                                         "Ariel Natama",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 2,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w700,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         height: bodyHeight * 0.02,
    //                                       ),
    //                                       Text(
    //                                         "Teknis",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                       Text(
    //                                         "134173676713",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: bodyHeight * 0.025,
    //                                 ),
    //                                 Row(
    //                                   children: [
    //                                     Container(
    //                                       height: bodyHeight * 0.34,
    //                                       width: MediaQuery.of(context)
    //                                               .size
    //                                               .width *
    //                                           0.42,
    //                                       decoration: BoxDecoration(
    //                                           borderRadius:
    //                                               BorderRadius.circular(12),
    //                                           color: Yellow1.withOpacity(0.5)),
    //                                       padding: EdgeInsets.only(
    //                                         left: MediaQuery.of(context)
    //                                                 .size
    //                                                 .width *
    //                                             0.06,
    //                                         right: MediaQuery.of(context)
    //                                                 .size
    //                                                 .width *
    //                                             0.06,
    //                                         bottom: bodyHeight * 0.02,
    //                                         top: bodyHeight * 0.03,
    //                                       ),
    //                                       child: Column(
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.center,
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment.center,
    //                                         children: [
    //                                           Text(
    //                                             "Check In",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.6,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w700,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: bodyHeight * 0.025,
    //                                           ),
    //                                           Text(
    //                                             "19 Juni 2022",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.5,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                           ),
    //                                           Text(
    //                                             "08.15",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.5,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: MediaQuery.of(context)
    //                                               .size
    //                                               .width *
    //                                           0.06,
    //                                     ),
    //                                     Container(
    //                                       height: bodyHeight * 0.34,
    //                                       width: MediaQuery.of(context)
    //                                               .size
    //                                               .width *
    //                                           0.42,
    //                                       decoration: BoxDecoration(
    //                                           borderRadius:
    //                                               BorderRadius.circular(12),
    //                                           color: Yellow1.withOpacity(0.5)),
    //                                       padding: EdgeInsets.only(
    //                                         left: MediaQuery.of(context)
    //                                                 .size
    //                                                 .width *
    //                                             0.06,
    //                                         right: MediaQuery.of(context)
    //                                                 .size
    //                                                 .width *
    //                                             0.06,
    //                                         bottom: bodyHeight * 0.02,
    //                                         top: bodyHeight * 0.03,
    //                                       ),
    //                                       child: Column(
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.center,
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment.center,
    //                                         children: [
    //                                           Text(
    //                                             "Check Out",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.6,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w700,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: bodyHeight * 0.025,
    //                                           ),
    //                                           Text(
    //                                             "19 Juni 2022",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.5,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                           ),
    //                                           Text(
    //                                             "16.35",
    //                                             textAlign: TextAlign.start,
    //                                             textScaleFactor: 1.5,
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(
    //                                   height: bodyHeight * 0.025,
    //                                 ),
    //                                 Container(
    //                                   height: bodyHeight * 0.14,
    //                                   width: MediaQuery.of(context).size.width,
    //                                   decoration: BoxDecoration(
    //                                       borderRadius:
    //                                           BorderRadius.circular(12),
    //                                       color: Yellow1.withOpacity(0.5)),
    //                                   padding: EdgeInsets.only(
    //                                     left:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     right:
    //                                         MediaQuery.of(context).size.width *
    //                                             0.06,
    //                                     bottom: bodyHeight * 0.02,
    //                                     top: bodyHeight * 0.01,
    //                                   ),
    //                                   child: Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.center,
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.center,
    //                                     children: [
    //                                       Text(
    //                                         "Total Jam Kerja",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.6,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w700,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         height: bodyHeight * 0.01,
    //                                       ),
    //                                       Text(
    //                                         "08.20.16",
    //                                         textAlign: TextAlign.start,
    //                                         textScaleFactor: 1.5,
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           Padding(
    //                               padding: EdgeInsets.only(
    //                                   bottom: MediaQuery.of(context)
    //                                           .viewInsets
    //                                           .bottom *
    //                                       0.4))
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         }
    //       } else {
    //         return LoadingView();
    //       }
    //     });
  }
}
