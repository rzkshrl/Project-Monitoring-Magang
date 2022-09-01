import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme.dart';
import '../controllers/list_attendance_h_r_controller.dart';

class ListAttendanceHRView extends GetView<ListAttendanceHRController> {
  const ListAttendanceHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: light,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: bodyHeight * 0.01,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.02,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: bodyHeight * 0.04,
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
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            FocusedMenuHolder(
                              onPressed: () {},
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text("Absensi Saya"),
                                    onPressed: () => Get.back(),
                                    trailingIcon: Icon(IconlyLight.profile),
                                    backgroundColor: Yellow1),
                                FocusedMenuItem(
                                    title: Text(
                                      "Absensi Karyawan",
                                    ),
                                    onPressed: () {},
                                    trailingIcon: Icon(IconlyLight.user_1),
                                    backgroundColor: Yellow1),
                              ],
                              blurBackgroundColor: Grey1,
                              blurSize: 0,
                              openWithTap: true,
                              menuOffset: bodyHeight * 0.02,
                              menuWidth:
                                  MediaQuery.of(context).size.width * 0.9,
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
                        SizedBox(
                          height: bodyHeight * 0.06,
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * 0.4))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
