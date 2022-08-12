import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';

import '../../../theme/theme.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/edit_emailpass_controller.dart';

class EditEmailpassView extends GetView<EditEmailpassController> {
  const EditEmailpassView({Key? key}) : super(key: key);
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
                      height: bodyHeight * 0.06,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Get.to(HomeView()),
                            icon: Icon(
                              Icons.arrow_back,
                              color: dark,
                            ))
                      ],
                    ),
                    SizedBox(height: bodyHeight * 0.04),
                    Container(
                      child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.46,
                              height: bodyHeight * 0.22,
                              color: Colors.grey.shade200,
                              child: Center(child: Text("X")),
                              // child: Image.network(src),
                            ),
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
                                      color: Yellow1,
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
                                            color: Grey1,
                                            fontSize: 14 * textScale),
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
                                      color: Yellow1,
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
                                            color: Grey1,
                                            fontSize: 14 * textScale),
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
                                'Kirim',
                                textScaleFactor: 1.3,
                                style: headingBtn.copyWith(color: Yellow1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * 1))
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
