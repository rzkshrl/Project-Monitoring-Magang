import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/widgets/custom_icon_all_icons.dart';
import 'package:project_magang/app/widgets/custom_icon_login_icons.dart';

import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_home_icons.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: bodyHeight * 0.025,
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
                  width: bodyHeight * 0.025,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
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
                          "BackEnd Developer",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "arielsimanjutak@gmail.com",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CustomIconAll.pencil,
                        color: Grey1,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.04,
            ),
            Container(
              height: bodyHeight * 0.42,
              width: bodyHeight * 0.49,
              padding: EdgeInsets.fromLTRB(15, 25, 15, 20),
              decoration: BoxDecoration(
                  color: Grey1, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pengaturan Akun",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.025,
                    ),
                    Container(width: 400, height: 2, color: dark),
                    Container(
                      width: bodyHeight * 0.49,
                      height: bodyHeight * 0.07,
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
                                  CustomIconLogin.mail,
                                  color: dark,
                                )),
                            hintText: 'Email',
                            hintStyle: heading6.copyWith(color: dark),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(width: 400, height: 2, color: dark),
                    Container(
                      width: bodyHeight * 0.49,
                      height: bodyHeight * 0.07,
                      decoration: BoxDecoration(
                          color: Grey1,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        style: TextStyle(color: dark),
                        // obscureText: controller.isPasswordHidden.value,
                        // controller: passC,
                        decoration: InputDecoration(
                            prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  CustomIconLogin.lock,
                                  color: dark,
                                )),
                            hintText: 'Password',
                            hintStyle: heading6.copyWith(color: dark),
                            // suffixIcon: IconButton(
                            //   color: dark,
                            //   splashRadius: 1,
                            //   icon: Icon(controller.isPasswordHidden.value
                            //       ? Icons.visibility_outlined
                            //       : Icons.visibility_off_outlined),
                            //   onPressed: () {
                            //     controller.isPasswordHidden.value =
                            //         !controller.isPasswordHidden.value;
                            //   },
                            // ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight * 0.02,
                    ),
                    Container(
                      height: bodyHeight * 0.11,
                      width: bodyHeight * 0.36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Blue1,
                          border: Border.all(width: 5.0, color: Yellow1)),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CustomIconAll.majesticons_logout_half_circle,
                                color: Yellow1, size: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(fontSize: 14),
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
                    SizedBox(
                      height: bodyHeight * 0.020,
                    )
                  ]),
            ),
            SizedBox(height: bodyHeight * 0.29),
            Container(
              height: bodyHeight * 0.1,
              width: MediaQuery.of(context).size.width,
              color: backgroundBlue,
            ),
          ],
        ),
      ),
    );
  }
}
