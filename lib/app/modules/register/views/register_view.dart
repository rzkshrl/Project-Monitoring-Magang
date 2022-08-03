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
        backgroundColor: backgroundBlue,
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
                                  hintStyle: heading6.copyWith(color: Grey1),
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
                                      hintStyle:
                                          heading6.copyWith(color: Grey1),
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
                                  elevation: 5,
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
                                          child: popupWidget,
                                          color: light,
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
                          'Masuk',
                          style: headingBtn.copyWith(
                              color: Yellow1, fontSize: 18 * textScale),
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
                        style: regular12pt.copyWith(
                            color: light,
                            decoration: TextDecoration.underline,
                            fontSize: 12 * textScale),
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
                          style: regular12pt.copyWith(
                              color: light, fontSize: 12 * textScale),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(LoginView()),
                          child: Text(
                            'Masuk',
                            style: bold12pt.copyWith(
                                color: light,
                                decoration: TextDecoration.underline,
                                fontSize: 12 * textScale),
                          ),
                        )
                      ],
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
