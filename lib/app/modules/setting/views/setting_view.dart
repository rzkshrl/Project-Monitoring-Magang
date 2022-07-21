import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/widgets/custom_icon_login_icons.dart';

import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_home_icons.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
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
                        "ARIEL SIMANJUTAK",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(CustomIconHome.attendance, color: Yellow1, size: 38)
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
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
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
                    height: 10,
                  ),
                  Container(width: 350, height: 2, color: dark),
                  Container(
                    width: 365,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Grey1, borderRadius: BorderRadius.circular(10)),
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(width: 350, height: 2, color: dark),
                  Container(
                    width: 370,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Grey1, borderRadius: BorderRadius.circular(10)),
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 75,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Blue1,
                        border: Border.all(width: 5.0, color: Yellow1)),
                    child: TextButton(
                      onPressed: () {},
                      /*authC.login(emailC.text, passC.text)*/
                      child: Text(
                        'Logout',
                        style: headingBtn.copyWith(color: Yellow1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
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
