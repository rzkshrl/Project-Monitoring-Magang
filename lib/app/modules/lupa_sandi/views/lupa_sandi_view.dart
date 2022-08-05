import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/widgets/custom_icon_all_icons.dart';

import '../../../widgets/custom_icon_login_icons.dart';
import '../../login/views/login_view.dart';
import '../../register/views/register_view.dart';
import '../controllers/lupa_sandi_controller.dart';

class LupaSandiView extends GetView<LupaSandiController> {
  const LupaSandiView({Key? key}) : super(key: key);
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
                      height: bodyHeight * 0.08,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Get.to(LoginView()),
                            icon: Icon(
                              Icons.arrow_back,
                              color: light,
                            ))
                      ],
                    ),
                    SizedBox(height: bodyHeight * 0.16),
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
                      height: bodyHeight * 0.03,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: bodyHeight * 0.02,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Blue1,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Kami akan kirimkan link reset password ke email anda",
                              textAlign: TextAlign.center,
                              textScaleFactor: 0.8,
                              style: regular12pt.copyWith(color: light),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: bodyHeight * 0.03,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight * 0.035,
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
