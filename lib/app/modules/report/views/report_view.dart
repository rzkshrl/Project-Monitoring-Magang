import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/widgets/custom_icon_home_icons.dart';
import 'package:get/get.dart';
import 'package:project_magang/app/theme/theme.dart';
import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
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
            height: 320,
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
                  onPressed: () => Get.to(HomeView()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIconHome.report, color: Yellow1, size: 38),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'New Report',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              // Location
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
        footer: new Footer(
          backgroundColor: backgroundBlue,
          child: Container(),
        ),
        flex: 2,
      ),
    );
  }
}
