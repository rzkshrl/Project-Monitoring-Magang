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
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final myAppBar = AppBar(
      toolbarHeight: 82,
      title: Image.asset(
        'assets/icons/icon.png',
        fit: BoxFit.cover,
        width: 220,
        height: 40,
      ),
      centerTitle: true,
      backgroundColor: Blue1,
    );
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: bodyHeight * 0.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Attendance
                Container(
                  height: 85,
                  width: 235,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Blue1,
                      border: Border.all(width: 5.0, color: Yellow1)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(CustomIconHome.report, color: Yellow1, size: 38),
                        Text(
                          'New Report',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Yellow1),
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
              ],
            ),
            SizedBox(height: bodyHeight * 0.39),
            Container(
              height: bodyHeight * 0.103,
              width: MediaQuery.of(context).size.width,
              color: backgroundBlue,
            ),
          ],
        ),
      ),
    );
  }
}
