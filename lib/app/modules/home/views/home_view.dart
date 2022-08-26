import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/attendance/views/attendance_view.dart';
import 'package:project_magang/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_magang/app/modules/location/views/location_view.dart';
import 'package:project_magang/app/modules/report/views/report_view.dart';
import 'package:project_magang/app/modules/setting/views/setting_view.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/utils/loading.dart';

import '../../../controller/auth_controller.dart';
import '../../attendanceHR/views/attendance_h_r_view.dart';
import '../../dashboardHR/views/dashboard_h_r_view.dart';
import '../../list_locationHR/views/list_location_h_r_view.dart';
import '../../settingHR/views/setting_h_r_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final authC = Get.find<AuthController>();
  @override
  buildBottomNavigationMenu(context, controller) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Obx(() => Container(
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          height: bodyHeight * 0.09,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: bodyHeight * 0.025,
            ),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: SizedBox(
                  height: bodyHeight * 0.065,
                  child: BottomNavigationBar(
                      selectedItemColor: Yellow1,
                      unselectedItemColor: Yellow1.withOpacity(0.5),
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      selectedFontSize: 0.0,
                      unselectedFontSize: 0.0,
                      // backgroundColor: Blue1,
                      type: BottomNavigationBarType.shifting,
                      elevation: 0,
                      onTap: controller.changeTabIndex,
                      currentIndex: controller.tabIndex.value,
                      items: [
                        _bottomNavBarItem(
                            icon: IconlyLight.home, label: "Dashboard"),
                        _bottomNavBarItem(
                            icon: IconlyLight.time_circle, label: "Attendance"),
                        _bottomNavBarItem(
                            icon: IconlyLight.document, label: "Report"),
                        _bottomNavBarItem(
                            icon: IconlyLight.location, label: "Location"),
                        _bottomNavBarItem(
                            icon: IconlyLight.setting, label: "Setting")
                      ]),
                ),
              ),
            ),
          ),
        ));
  }

  buildBottomNavigationMenuHR(context, controller) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Obx(() => Container(
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          height: bodyHeight * 0.09,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: bodyHeight * 0.025,
            ),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: SizedBox(
                  height: bodyHeight * 0.065,
                  child: BottomNavigationBar(
                      selectedItemColor: Yellow1,
                      unselectedItemColor: Yellow1.withOpacity(0.5),
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      selectedFontSize: 0.0,
                      unselectedFontSize: 0.0,
                      // backgroundColor: Blue1,
                      type: BottomNavigationBarType.shifting,
                      elevation: 0,
                      onTap: controller.changeTabIndex,
                      currentIndex: controller.tabIndex.value,
                      items: [
                        _bottomNavBarItem(
                            icon: IconlyLight.home, label: "Dashboard"),
                        _bottomNavBarItem(
                            icon: IconlyLight.time_circle, label: "Attendance"),
                        _bottomNavBarItem(
                            icon: IconlyLight.location, label: "Location"),
                        _bottomNavBarItem(
                            icon: IconlyLight.setting, label: "Setting")
                      ]),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    final HomeController controller =
        Get.put(HomeController(), permanent: false);

    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: authC.role(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return LoadingView();
          }
          if (snap.hasData) {
            var role = snap.data!.get("divisi");
            log("${role}");
            if (role != "HR & Legal") {
              return Scaffold(
                extendBody: true,
                bottomNavigationBar:
                    buildBottomNavigationMenu(context, controller),
                body: Obx(() => GestureDetector(
                      child: IndexedStack(
                        index: controller.tabIndex.value,
                        children: [
                          DashboardView(),
                          AttendanceView(),
                          ReportView(),
                          LocationView(),
                          SettingView()
                        ],
                      ),
                    )),
              );
            } else {
              return Scaffold(
                  extendBody: true,
                  bottomNavigationBar:
                      buildBottomNavigationMenuHR(context, controller),
                  body: Obx(() => GestureDetector(
                        child: IndexedStack(
                          index: controller.tabIndex.value,
                          children: [
                            DashboardHRView(),
                            AttendanceHRView(),
                            ListLocationHRView(),
                            SettingHRView()
                          ],
                        ),
                      )));
            }
          } else {
            return LoadingView();
          }
        });
  }

  _bottomNavBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: Blue1,
    );
  }
}
