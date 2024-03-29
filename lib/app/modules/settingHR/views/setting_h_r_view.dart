import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/routes/app_pages.dart';
import 'package:project_magang/app/utils/loading.dart';

import '../../../controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../../edit_emailpassHR/views/edit_emailpass_h_r_view.dart';

import '../../edit_profileHR/views/edit_profile_h_r_view.dart';
import '../controllers/setting_h_r_controller.dart';

class SettingHRView extends GetView<SettingHRController> {
  const SettingHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    final authC = Get.find<AuthController>();
    final SettingHRController controller = Get.put(SettingHRController());
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
        backgroundColor: light,
        body: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.getUserDoc(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return LoadingView();
              }
              if (snap.hasData) {
                var nama = snap.data!.get("name");
                var divisi = snap.data!.get("divisi");
                var nomor_induk = snap.data!.get("nomor_induk");
                var email = snap.data!.get("email");
                var pass = snap.data!.get("password");
                var defaultImage =
                    "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      bottom: bodyHeight * 0.02,
                    ),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            SizedBox(
                              height: bodyHeight * 0.12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: bodyHeight * 0.01,
                                ),
                                ClipOval(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    height: bodyHeight * 0.09,
                                    color: Colors.grey.shade200,
                                    child: Image.network(
                                      snap.data!.get("profile") != null
                                          ? snap.data!.get("profile") != ""
                                              ? snap.data!.get("profile")
                                              : defaultImage
                                          : defaultImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: bodyHeight * 0.015,
                                ),
                                Container(
                                  height: bodyHeight * 0.125,
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.06,
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    bottom: bodyHeight * 0.015,
                                    top: bodyHeight * 0.025,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Grey1,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            "$nama",
                                            textAlign: TextAlign.start,
                                            textScaleFactor: 1.2,
                                            overflow: TextOverflow.ellipsis,
                                            style: regular12pt.copyWith(
                                                color: dark,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: bodyHeight * 0.01,
                                          ),
                                          Text(
                                            "$divisi",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            "$nomor_induk",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15.sp),
                                          ),
                                          // SizedBox(
                                          //   width: MediaQuery.of(context)
                                          //           .size
                                          //           .width *
                                          //       0.2,
                                          // ),
                                        ],
                                      ),
                                      ClipOval(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: IconButton(
                                            onPressed: () => Get.toNamed(
                                                Routes.EDIT_PROFILE_H_R,
                                                arguments: snap.data!.data()),
                                            icon: Icon(
                                              IconlyLight.edit,
                                              color: dark,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: bodyHeight * 0.075,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  "Pengaturan Akun",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: IconButton(
                                      onPressed: () => Get.toNamed(
                                          Routes.EDIT_EMAILPASS_H_R,
                                          arguments: snap.data!.data()),
                                      icon: Icon(
                                        IconlyLight.edit,
                                        color: dark,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: bodyHeight * 0.010,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: bodyHeight * 0.065,
                              decoration: BoxDecoration(
                                  color: Yellow1,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.message,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.015,
                                  ),
                                  Text(
                                    "$email",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1,
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
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: bodyHeight * 0.065,
                              decoration: BoxDecoration(
                                  color: Yellow1,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.lock,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.015,
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.isPasswordHidden == false
                                          ? "$pass"
                                          : '${'${pass.replaceAll(RegExp(r"."), "*")}'}',
                                      textAlign: TextAlign.start,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: bodyHeight * 0.045,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: bodyHeight * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Blue1,
                              ),
                              child: TextButton(
                                onPressed: () => authC.logout(),
                                /*authC.logut(emailC.text, passC.text)*/
                                child: Text(
                                  'Logout',
                                  textScaleFactor: 1.3,
                                  style: headingBtn.copyWith(color: Yellow1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return LoadingView();
              }
            }),
      ),
    );
  }
}
