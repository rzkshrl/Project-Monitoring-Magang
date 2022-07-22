import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_login_icons.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);
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
              height: 70,
            ),
            Container(
              height: bodyHeight * 0.81,
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey.shade200,
                      child: Center(child: Text("X")),
                      // child: Image.network(src),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 269,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Grey1,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            style: TextStyle(color: dark),
                            decoration: InputDecoration(
                                prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      CustomIconLogin.person,
                                      color: dark,
                                    )),
                                hintText: 'Nama',
                                hintStyle: heading6.copyWith(color: dark),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 269,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Grey1,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            style: TextStyle(color: dark),
                            decoration: InputDecoration(
                                prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      CustomIconLogin.organization,
                                      color: dark,
                                    )),
                                hintText: 'Divisi',
                                hintStyle: heading6.copyWith(color: dark),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 75,
                    width: 215,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Blue1,
                        border: Border.all(width: 5.0, color: Yellow1)),
                    child: TextButton(
                      onPressed: () {},
                      /*authC.login(emailC.text, passC.text)*/
                      child: Text(
                        'Send',
                        style: headingBtn.copyWith(color: Yellow1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: bodyHeight * 0.102,
              width: MediaQuery.of(context).size.width,
              color: backgroundBlue,
            ),
          ],
        ),
      ),
    );
  }
}
