import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/modules/login/views/login_view.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/widgets/custom_icon_login_icons.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(36, 200, 24, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/icon.png',
                    width: 335,
                    height: 46,
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
                      width: 269,
                      height: 50,
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
                          color: light,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 269,
                      height: 50,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 269,
                      height: 50,
                      decoration: BoxDecoration(
                          color: light,
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
                      height: 20,
                    ),
                    Container(
                      width: 269,
                      height: 50,
                      decoration: BoxDecoration(
                          color: light,
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
                            hintText: 'Verify Password',
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
                    'Register',
                    style: headingBtn.copyWith(color: Yellow1),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: regular12pt.copyWith(color: light),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(LoginView()),
                    child: Text(
                      'Login',
                      style: bold12pt.copyWith(
                          color: light, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
