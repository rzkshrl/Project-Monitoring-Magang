import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import 'package:project_magang/app/modules/lupa_sandi/views/lupa_sandi_view.dart';
import 'package:project_magang/app/modules/register/views/register_view.dart';
import 'package:project_magang/app/theme/theme.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/loading.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  DateTime lastTimeBackbuttonWasClicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
            Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tekan tombol kembali sekali lagi untuk keluar"),
              duration: Duration(seconds: 2),
            ),
          );

          lastTimeBackbuttonWasClicked = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: backgroundBlue,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundBlue,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final textScale = MediaQuery.of(context).textScaleFactor;
              final bodyHeight = MediaQuery.of(context).size.height;
              -MediaQuery.of(context).padding.top;
              final bodyWidth = MediaQuery.of(context).size.width;
              return SingleChildScrollView(
                reverse: true,
                padding: EdgeInsets.only(
                  left: bodyWidth * 0.05,
                  right: bodyWidth * 0.05,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.227,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/logo.png',
                          width: bodyWidth * 0.5,
                          height: bodyHeight * 0.05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.08,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: controller.emailKey.value,
                          child: Container(
                            width: bodyWidth * 1,
                            height: bodyHeight * 0.085,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              validator: controller.emailValidator,
                              controller: controller.emailC,
                              style: TextStyle(color: dark),
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }

                                // controller.iconEmail.value =
                                //     !controller.iconEmail.value;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.message,
                                        color: Blue1,
                                      )),
                                  focusColor: Blue1,
                                  fillColor: light,
                                  filled: true,
                                  errorStyle: TextStyle(
                                    fontSize: 13.5 * textScale,
                                    color: light,
                                    background: Paint()
                                      ..strokeWidth = 13
                                      ..color = errorBg
                                      ..style = PaintingStyle.stroke
                                      ..strokeJoin = StrokeJoin.round,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: errorBg, width: 1.8),
                                      borderRadius: BorderRadius.circular(12),
                                      gapPadding: 2),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: error, width: 1.8),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Blue1, width: 1.8),
                                      borderRadius: BorderRadius.circular(12)),
                                  hintText: 'Email',
                                  hintStyle: heading6.copyWith(
                                      color: Grey1, fontSize: 14 * textScale),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: bodyHeight * 0.01,
                        ),
                        Form(
                          key: controller.passKey.value,
                          child: Obx(
                            () => Container(
                              width: bodyWidth * 1,
                              height: bodyHeight * 0.085,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: dark),
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }

                                  // controller.iconPass.value =
                                  //     !controller.iconPass.value;
                                },
                                validator: controller.passValidator,
                                obscureText: controller.isPasswordHidden.value,
                                controller: controller.passC,
                                decoration: InputDecoration(
                                    prefixIcon: Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          IconlyLight.lock,
                                          color: Blue1,
                                        )),
                                    hintText: 'Kata Sandi',
                                    hintStyle: heading6.copyWith(
                                        color: Grey1, fontSize: 14 * textScale),
                                    fillColor: light,
                                    filled: true,
                                    errorStyle: TextStyle(
                                      fontSize: 13.5 * textScale,
                                      color: light,
                                      background: Paint()
                                        ..strokeWidth = 13
                                        ..color = errorBg
                                        ..style = PaintingStyle.stroke
                                        ..strokeJoin = StrokeJoin.round,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: errorBg, width: 1.8),
                                        borderRadius: BorderRadius.circular(12),
                                        gapPadding: 2),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: error, width: 1.8),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Blue1, width: 1.8),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      child: IconButton(
                                        color: Colors.black26,
                                        splashRadius: 1,
                                        icon: Icon(
                                            controller.isPasswordHidden.value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded),
                                        onPressed: () {
                                          controller.isPasswordHidden.value =
                                              !controller
                                                  .isPasswordHidden.value;
                                        },
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.06,
                    ),
                    Container(
                      width: bodyWidth * 1,
                      height: bodyHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Blue1,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (controller.emailKey.value.currentState!
                                  .validate() &&
                              controller.passKey.value.currentState!
                                  .validate()) {
                            authC.login(
                                controller.emailC.text, controller.passC.text);
                          }
                        },
                        child: Text(
                          'Masuk',
                          textScaleFactor: 1.25,
                          style: headingBtn.copyWith(color: Yellow1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight * 0.03,
                    ),
                    TextButton(
                      onPressed: () => Get.to(LupaSandiView()),
                      child: Text(
                        'Lupa Kata Sandi?',
                        textScaleFactor: 0.8,
                        style: regular12pt.copyWith(
                          color: light,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          textScaleFactor: 0.8,
                          style: regular12pt.copyWith(color: light),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(RegisterView()),
                          child: Text(
                            'Daftar',
                            textScaleFactor: 0.8,
                            style: bold12pt.copyWith(
                              color: light,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.01,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * 0.4))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
