import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/modules/setting/views/setting_view.dart';

import '../../../theme/theme.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

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
                    Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: ClipOval(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.46,
                                  height: bodyHeight * 0.22,
                                  color: Colors.grey.shade200,
                                  child: Center(child: Text("X")),
                                  // child: Image.network(src),
                                ),
                              ),
                            ),
                            //button untuk ganti foto profil
                            Positioned(
                              top: bodyHeight * 0.16,
                              left: MediaQuery.of(context).size.width * 0.55,
                              child: ClipOval(
                                child: Material(
                                  color: backgroundBlue,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.camera,
                                      color: light,
                                    ),
                                  ),
                                ),
                              ),
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
                                height: bodyHeight * 0.025,
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
                                                  hintStyle: heading6.copyWith(
                                                      color: Grey1,
                                                      fontSize: 14 * textScale),
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
                                      elevation: 0,
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
                                              decoration: BoxDecoration(
                                                  color: light,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(0, 0.5),
                                                        blurRadius: 1,
                                                        color: dark
                                                            .withOpacity(0.5))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: popupWidget,
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
