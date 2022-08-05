import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_login_icons.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);
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
                      height: bodyHeight * 0.2,
                    ),
                    Container(
                      height: bodyHeight * 0.81,
                      child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 155,
                              height: 155,
                              color: Colors.grey.shade200,
                              child: Center(child: Text("X")),
                              // child: Image.network(src),
                            ),
                          ),
                          SizedBox(
                            height: 40,
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
                                            color: Grey1,
                                            fontSize: 14 * textScale),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: bodyHeight * 0.065,
                                  decoration: BoxDecoration(
                                      color: Yellow1,
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
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                                    prefixIcon: Align(
                                                        widthFactor: 1.0,
                                                        heightFactor: 1.0,
                                                        child: Icon(
                                                          IconlyLight.user_1,
                                                          color: Grey1,
                                                        )),
                                                    hintText: "Divisi",
                                                    hintStyle: heading6
                                                        .copyWith(color: Grey1),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none))),
                                    popupProps: PopupProps.menu(
                                      constraints: BoxConstraints(
                                          maxHeight: bodyHeight * 0.18),
                                      scrollbarProps: ScrollbarProps(
                                          trackVisibility: true,
                                          trackColor: dark),
                                      fit: FlexFit.loose,
                                      menuProps: MenuProps(
                                        borderRadius: BorderRadius.circular(12),
                                        backgroundColor: Colors.transparent,
                                        elevation: 5,
                                      ),
                                      containerBuilder: (ctx, popupWidget) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
