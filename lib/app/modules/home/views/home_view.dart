import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/controller/auth_controller.dart';
import 'package:project_magang/app/modules/attendance/views/attendance_view.dart';
import 'package:project_magang/app/modules/attendanceHR/views/attendance_h_r_view.dart';
import 'package:project_magang/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_magang/app/modules/dashboardHR/views/dashboard_h_r_view.dart';
import 'package:project_magang/app/modules/home/controllers/home_controller.dart';
import 'package:project_magang/app/modules/list_locationHR/views/list_location_h_r_view.dart';
import 'package:project_magang/app/modules/location/views/location_view.dart';
import 'package:project_magang/app/modules/report/views/report_view.dart';
import 'package:project_magang/app/modules/setting/views/setting_view.dart';
import 'package:project_magang/app/modules/settingHR/views/setting_h_r_view.dart';

import '../../../theme/theme.dart';
import '../../../utils/loading.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[
      DashboardView(),
      AttendanceView(),
      LocationView(),
      ReportView(),
      SettingView(),
      DashboardHRView(),
      AttendanceHRView(),
      ListLocationHRView(),
      SettingHRView()
    ];

    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: authC.role(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          }
          if (snap.hasData) {
            var role = snap.data!.get("divisi");
            if (role != "HR & Legal") {
              return Scaffold(
                body: Obx(() => pages[controller.currentIndex.value]),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: backgroundBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      navBarItem(context, IconlyLight.home, 0),
                      navBarItem(context, IconlyLight.time_circle, 1),
                      navBarItem(context, IconlyLight.location, 2),
                      navBarItem(context, IconlyLight.document, 3),
                      navBarItem(context, IconlyLight.setting, 4),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Obx(() => pages[controller.currentIndex.value]),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: backgroundBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      navBarItem(context, IconlyLight.home, 5),
                      navBarItem(context, IconlyLight.time_circle, 6),
                      navBarItem(context, IconlyLight.location, 7),
                      navBarItem(context, IconlyLight.setting, 8),
                    ],
                  ),
                ),
              );
            }
          } else {
            return LoadingView();
          }
        });
  }

  Widget navBarItem(BuildContext context, IconData icon, int index) {
    double bodyHeight = MediaQuery.of(context).size.height;
    // double bodyWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.changePage(index);
      },
      child: SizedBox(
        height: bodyHeight * 0.075,
        child: SizedBox(
          width: 25,
          height: 25,
          child: Obx(
            () => Icon(
              icon,
              color: (index == controller.currentIndex.value)
                  ? Yellow1
                  : Yellow1.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
