import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/controller/auth_controller.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/routes/app_pages.dart';
import 'package:project_magang/app/utils/loading.dart';
import 'package:project_magang/app/utils/menu_item.dart';
import 'package:project_magang/app/utils/menu_item_att.dart';

import '../../../theme/theme.dart';
import '../../list_attendanceHR/views/list_attendance_h_r_view.dart';
import '../controllers/attendance_h_r_controller.dart';

class AttendanceHRView extends GetView<AttendanceHRController> {
  AttendanceHRView({Key? key}) : super(key: key);

  final AttendanceHRController controller = Get.put(AttendanceHRController());
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
                          height: bodyHeight * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FocusedMenuHolder(
                              onPressed: () {},
                              menuBoxDecoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  color: Yellow1),
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text("Absensi Saya"),
                                    onPressed: () {},
                                    trailingIcon: Icon(IconlyLight.profile),
                                    backgroundColor: Colors.transparent),
                                FocusedMenuItem(
                                    title: Text(
                                      "Absensi Karyawan",
                                    ),
                                    onPressed: () =>
                                        Get.to(ListAttendanceHRView()),
                                    trailingIcon: Icon(IconlyLight.user_1),
                                    backgroundColor: Colors.transparent),
                              ],
                              blurBackgroundColor: Grey1,
                              blurSize: 0,
                              openWithTap: true,
                              bottomOffsetHeight: bodyHeight * -1,
                              menuOffset: bodyHeight * 0.02,
                              menuWidth:
                                  MediaQuery.of(context).size.width * 0.9,
                              animateMenuItems: false,
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Icon(
                                    IconlyLight.filter,
                                    color: dark,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: bodyHeight * 0.02,
                        ),
                        Material(
                          color: Grey1,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            // onTap: () => Get.toNamed(Routes.LOCATION),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: bodyHeight * 0.4,
                              width: bodyWidth * 1,
                            ),
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
                          child: Column(
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "- -",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      color: Grey2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: bodyWidth * 0.6,
                                  ),
                                  Text(
                                    "- -",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      color: Grey2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
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
                                child: TextButton(
                                  onPressed: () {
                                    controller.getLokasi();
                                  },
                                  /*authC.logut(emailC.text, passC.text)*/
                                  child: Text(
                                    'Masuk',
                                    textScaleFactor: 1.1,
                                    style: headingBtn.copyWith(color: Yellow1),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
