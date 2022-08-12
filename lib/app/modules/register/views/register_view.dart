import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/login/views/login_view.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/widgets/custom_icon_login_icons.dart';

import '../../lupa_sandi/views/lupa_sandi_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: backgroundBlue,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundBlue,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            reverse: true,
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
                      height: bodyHeight * 0.2,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/logo.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: bodyHeight * 0.05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.08,
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: bodyHeight * 0.065,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              style: TextStyle(color: dark),
                              decoration: InputDecoration(
                                  prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.profile,
                                        color: Grey1,
                                      )),
                                  hintText: 'Nama',
                                  hintStyle: heading6.copyWith(
                                      color: Grey1, fontSize: 14 * textScale),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          SizedBox(
                            height: bodyHeight * 0.025,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: bodyHeight * 0.065,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(12)),
                            child: DropdownSearch<String>(
                              clearButtonProps: ClearButtonProps(
                                  isVisible: true, color: dark),
                              items: [
                                "Teknis",
                                "Marketing",
                                "Human Resource",
                                'Project Manager',
                                "Engineer",
                                'QA'
                              ],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: Icon(
                                            IconlyLight.user_1,
                                            color: Grey1,
                                          )),
                                      hintText: "Divisi",
                                      hintStyle: heading6.copyWith(
                                          color: Grey1,
                                          fontSize: 14 * textScale),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none))),
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(
                                    maxHeight: bodyHeight * 0.18),
                                scrollbarProps: ScrollbarProps(
                                    trackVisibility: true, trackColor: dark),
                                fit: FlexFit.loose,
                                menuProps: MenuProps(
                                  borderRadius: BorderRadius.circular(12),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                containerBuilder: (ctx, popupWidget) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                      ),
                                      Flexible(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: light,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 0.5),
                                                    blurRadius: 1,
                                                    color:
                                                        dark.withOpacity(0.5))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: popupWidget,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),

                          // Container(
                          //   width: MediaQuery.of(context).size.width * 1,
                          //   height: bodyHeight * 0.065,
                          //   decoration: BoxDecoration(
                          //       color: light,
                          //       borderRadius: BorderRadius.circular(12)),
                          //   child: TextFormField(
                          //     style: TextStyle(color: dark),
                          //     decoration: InputDecoration(
                          //         prefixIcon: Align(
                          //             widthFactor: 1.0,
                          //             heightFactor: 1.0,
                          //             child: Icon(
                          //               IconlyLight.user_1,
                          //               color: Grey1,
                          //             )),
                          //         hintText: 'Divisi',
                          //         hintStyle: heading6.copyWith(color: Grey1),
                          //         border: OutlineInputBorder(
                          //             borderSide: BorderSide.none)),
                          //   ),
                          // ),
                          SizedBox(
                            height: bodyHeight * 0.025,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: bodyHeight * 0.065,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: dark),
                              decoration: InputDecoration(
                                  prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.message,
                                        color: Grey1,
                                      )),
                                  hintText: 'Email',
                                  hintStyle: heading6.copyWith(
                                      color: Grey1, fontSize: 14 * textScale),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          SizedBox(
                            height: bodyHeight * 0.025,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: bodyHeight * 0.065,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              style: TextStyle(color: dark),
                              // obscureText: controller.isPasswordHidden.value,
                              // controller: passC,
                              decoration: InputDecoration(
                                  prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(
                                        IconlyLight.lock,
                                        color: Grey1,
                                      )),
                                  hintText: 'Kata Sandi',
                                  hintStyle: heading6.copyWith(
                                      color: Grey1, fontSize: 14 * textScale),
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight * 0.06,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: bodyHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Blue1,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        /*authC.login(emailC.text, passC.text)*/
                        child: Text(
                          'Daftar',
                          textScaleFactor: 1.3,
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
                      height: bodyHeight * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun? ',
                          textScaleFactor: 0.8,
                          style: regular12pt.copyWith(color: light),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(LoginView()),
                          child: Text(
                            'Masuk',
                            textScaleFactor: 0.8,
                            style: bold12pt.copyWith(
                              color: light,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom *
                                0.45))
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
