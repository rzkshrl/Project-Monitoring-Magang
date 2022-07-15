import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/theme/theme.dart';

import '../../../widgets/custom_icon_login_icons.dart';
import '../controllers/lupa_sandi_controller.dart';

class LupaSandiView extends GetView<LupaSandiController> {
  const LupaSandiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlue,
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(24, 255, 24, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/icons/icon.png',
                          width: 427,
                          height: 120,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 299,
                            height: 60,
                            decoration: BoxDecoration(
                                color: light,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
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
                  ]))),
    );
  }
}
