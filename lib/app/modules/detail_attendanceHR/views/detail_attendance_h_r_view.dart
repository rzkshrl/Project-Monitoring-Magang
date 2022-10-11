import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../../../utils/loading.dart';
import '../controllers/detail_attendance_h_r_controller.dart';

class DetailAttendanceHRView extends GetView<DetailAttendanceHRController> {
  DetailAttendanceHRView({Key? key}) : super(key: key);
  final DetailAttendanceHRController controller =
      Get.put(DetailAttendanceHRController());

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    // log("${user}");
    var uid = user['uid'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: light,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamDataPresenceUser(uid),
          builder: (context, snap) {
            final textScale = MediaQuery.of(context).textScaleFactor;
            final bodyHeight = MediaQuery.of(context).size.height;
            -MediaQuery.of(context).padding.top;
            final bodyWidth = MediaQuery.of(context).size.width;
            var nama = user['name'];
            var profile = user['profile'];
            var defaultImage =
                "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
            if (snap.connectionState == ConnectionState.active) {
              print(snap.data?.docs);
              if (snap.data?.docs.length == 0 || snap.data == null) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: bodyWidth * 0.05,
                    right: bodyWidth * 0.05,
                    bottom: bodyHeight * 0.01,
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
                        height: bodyHeight * 0.38,
                      ),
                      Center(
                        child: Text(
                          "Belum ada riwayat Absensi",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.15,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                reverse: false,
                padding: EdgeInsets.only(
                  left: bodyWidth * 0.05,
                  right: bodyWidth * 0.05,
                  bottom: bodyHeight * 0.01,
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
                        SizedBox(
                          width: bodyWidth * 0.5,
                        ),
                        FocusedMenuHolder(
                          onPressed: () {},
                          menuBoxDecoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: Yellow1),
                          menuItems: [
                            FocusedMenuItem(
                                title: Text("Absensi Saya"),
                                onPressed: () => Get.back(),
                                trailingIcon: Icon(IconlyLight.profile),
                                backgroundColor: Colors.transparent),
                            FocusedMenuItem(
                                title: Text(
                                  "Absensi Karyawan",
                                ),
                                onPressed: () {},
                                trailingIcon: Icon(IconlyLight.user_1),
                                backgroundColor: Colors.transparent),
                          ],
                          blurBackgroundColor: Grey1,
                          blurSize: 0,
                          openWithTap: true,
                          bottomOffsetHeight: bodyHeight * -5,
                          menuOffset: bodyHeight * 0.02,
                          menuWidth: bodyWidth * 0.9,
                          animateMenuItems: false,
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Icon(IconlyLight.filter, color: dark),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: bodyWidth * 1,
                      height: bodyHeight * 0.065,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: dark),
                        decoration: InputDecoration(
                            prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  IconlyLight.search,
                                  color: Grey1,
                                )),
                            hintText: 'Cari',
                            hintStyle: heading6.copyWith(
                                color: Grey1, fontSize: 14 * textScale),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              snap.data!.docs[index].data();

                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: bodyHeight * 0.015),
                            child: Material(
                              color: Yellow1,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  width: bodyWidth * 1,
                                  height: bodyHeight * 0.095,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: bodyWidth * 0.06,
                                            left: bodyWidth * 0.06),
                                        child: Row(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width: bodyWidth * 0.155,
                                                    height: bodyHeight * 0.07,
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
                                              ],
                                            ),
                                            SizedBox(
                                              width: bodyWidth * 0.05,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Masuk",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 1.15,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(data['masuk']['date']))}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 0.9,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${DateFormat('HH:MM', 'id-ID').format(DateTime.parse(data['masuk']['date']))}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 0.9,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: bodyWidth * 0.095,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Keluar",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 1.15,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      data["keluar"] != null
                                                          ? "${DateFormat('d MMMM yyyy', 'id-ID').format(DateTime.parse(data['keluar']['date']))}"
                                                          : "",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 0.9,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      data["keluar"] != null
                                                          ? "${DateFormat('HH:MM', 'id-ID').format(DateTime.parse(data['keluar']['date']))}"
                                                          : "--",
                                                      textAlign:
                                                          TextAlign.start,
                                                      textScaleFactor: 0.9,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: bodyWidth * 0.13,
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                        }),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * 0.4))
                  ],
                ),
              );
            } else {
              return LoadingView();
            }
          }),
    );
  }
}
