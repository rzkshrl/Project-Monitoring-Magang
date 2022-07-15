import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/modules/attendance/views/attendance_view.dart';
import 'package:project_magang/app/modules/location/views/location_view.dart';
import 'package:project_magang/app/modules/report/views/report_view.dart';
import 'package:project_magang/app/modules/setting/views/setting_view.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/widgets/custom_icon_home_icons.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        title: Image.asset(
          'assets/icons/icon.png',
          fit: BoxFit.cover,
          width: 200,
          height: 35,
        ),
        centerTitle: true,
        backgroundColor: Blue1,
      ),
      body: FooterView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade200,
                  child: Center(child: Text("X")),
                  // child: Image.network(src),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome, ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "ARIEL SIMANJUTAK",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Have a nice day",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Grey1, borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Check In",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(" - ", style: TextStyle(fontSize: 22))
                    ],
                  ),
                  Container(width: 2, height: 55, color: dark),
                  Column(
                    children: [
                      Text("Check Out", style: TextStyle(fontSize: 22)),
                      Text(" - ", style: TextStyle(fontSize: 22))
                    ],
                  )
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Grey1,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Attendance
              Container(
                height: 112,
                width: 174,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Blue1,
                    border: Border.all(width: 5.0, color: Yellow1)),
                child: ElevatedButton(
                  onPressed: () => Get.to(AttendanceView()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIconHome.attendance, color: Yellow1, size: 38),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Attendance',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Blue1,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              // Location
              Container(
                height: 112,
                width: 174,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Blue1,
                    border: Border.all(width: 5.0, color: Yellow1)),
                child: ElevatedButton(
                  onPressed: () => Get.to(LocationView()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIconHome.location_1, color: Yellow1, size: 38),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Blue1,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Report
              Container(
                height: 112,
                width: 174,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Blue1,
                    border: Border.all(width: 5.0, color: Yellow1)),
                child: ElevatedButton(
                  onPressed: () => Get.to(ReportView()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIconHome.report, color: Yellow1, size: 38),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Report',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Blue1,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              // Setting
              Container(
                height: 112,
                width: 174,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Blue1,
                    border: Border.all(width: 5.0, color: Yellow1)),
                child: ElevatedButton(
                  onPressed: () => Get.to(SettingView()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIconHome.gear, color: Yellow1, size: 38),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Blue1,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        footer: new Footer(
          backgroundColor: backgroundBlue,
          child: Container(),
        ),
        flex: 3,
      ),
    );
  }
}
