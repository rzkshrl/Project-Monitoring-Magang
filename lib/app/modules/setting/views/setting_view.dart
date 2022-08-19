import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/edit_emailpass/views/edit_emailpass_view.dart';
import 'package:project_magang/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:project_magang/app/modules/login/views/login_view.dart';
import 'package:project_magang/app/widgets/custom_icon_all_icons.dart';
import 'package:project_magang/app/widgets/custom_icon_login_icons.dart';

import '../../../controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_home_icons.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    final authC = Get.find<AuthController>();
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
        backgroundColor: light,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: bodyHeight * 0.02,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxHeight),
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
                            width: MediaQuery.of(context).size.width * 0.19,
                            height: bodyHeight * 0.09,
                            color: Colors.grey.shade200,
                            child: Center(child: Text("X")),
                            // child: Image.network(src),
                          ),
                        ),
                        SizedBox(
                          width: bodyHeight * 0.015,
                        ),
                        Row(
                          children: [
                            Container(
                              height: bodyHeight * 0.115,
                              width: MediaQuery.of(context).size.width * 0.65,
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.06,
                                bottom: bodyHeight * 0.02,
                                top: bodyHeight * 0.02,
                              ),
                              decoration: BoxDecoration(
                                  color: Grey1,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            "Ariel Natama",
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
                                            "Teknis",
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "134173676713",
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      ClipOval(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: IconButton(
                                            onPressed: () =>
                                                Get.to(EditProfileView()),
                                            icon: Icon(
                                              IconlyLight.edit,
                                              color: dark,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                          width: MediaQuery.of(context).size.width * 0.01,
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
                          width: MediaQuery.of(context).size.width * 0.45,
                        ),
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () => Get.to(EditEmailpassView()),
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
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                IconlyLight.message,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Text(
                            "arielnatam0@gmail.com",
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
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                IconlyLight.lock,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Text(
                            "*************",
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
        ),
      ),
    );
  }
}
