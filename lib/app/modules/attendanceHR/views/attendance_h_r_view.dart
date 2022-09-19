import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/controller/auth_controller.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/routes/app_pages.dart';
import 'package:project_magang/app/utils/loading.dart';
import 'package:project_magang/app/utils/menu_item.dart';
import 'package:project_magang/app/utils/menu_item_att.dart';

import '../../../theme/theme.dart';
import '../../list_attendanceHR/views/list_attendance_h_r_view.dart';
import '../controllers/attendance_h_r_controller.dart';

class AttendanceHRView extends GetView<AttendanceHRController> {
  const AttendanceHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    final authC = Get.put(AuthController());

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: light,
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: authC.getUserDoc(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return LoadingView();
              }
              if (snap.hasData) {
                var nama = snap.data!.get("name");
                var defaultImage =
                    "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    reverse: true,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      bottom: bodyHeight * 0.01,
                    ),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            SizedBox(
                              height: bodyHeight * 0.02,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: bodyHeight * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FocusedMenuHolder(
                                      onPressed: () {},
                                      menuItems: [
                                        FocusedMenuItem(
                                            title: Text("Absensi Saya"),
                                            onPressed: () => Get.to(HomeView()),
                                            trailingIcon:
                                                Icon(IconlyLight.profile),
                                            backgroundColor: Yellow1),
                                        FocusedMenuItem(
                                            title: Text(
                                              "Absensi Karyawan",
                                            ),
                                            onPressed: () =>
                                                Get.to(ListAttendanceHRView()),
                                            trailingIcon:
                                                Icon(IconlyLight.user_1),
                                            backgroundColor: Yellow1),
                                      ],
                                      blurBackgroundColor: Grey1,
                                      blurSize: 0,
                                      openWithTap: true,
                                      menuOffset: bodyHeight * 0.02,
                                      menuWidth:
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                      animateMenuItems: false,
                                      child: ClipOval(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Icon(
                                            IconlyLight.filter,
                                            color: dark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: bodyHeight * 0.06,
                                ),
                                ClipOval(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    height: bodyHeight * 0.22,
                                    color: Colors.grey.shade200,
                                    child: Image.network(
                                      snap.data!.get("profile") != null
                                          ? snap.data!.get("profile") != ""
                                              ? snap.data!.get("profile")
                                              : defaultImage
                                          : defaultImage,
                                      fit: BoxFit.cover,
                                    ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height: bodyHeight * 0.065,
                                        decoration: BoxDecoration(
                                            color: Yellow1,
                                            borderRadius:
                                                BorderRadius.circular(12)),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height: bodyHeight * 0.065,
                                        decoration: BoxDecoration(
                                            color: Yellow1,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: DropdownSearch<String>(
                                          clearButtonProps: ClearButtonProps(
                                              isVisible: true, color: dark),
                                          items: [
                                            "Teknis",
                                            "Marketing & Sales",
                                            "HR & Legal",
                                            'Multimedia',
                                            "Finance",
                                          ],
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                          prefixIcon: Align(
                                                              widthFactor: 1.0,
                                                              heightFactor: 1.0,
                                                              child: Icon(
                                                                IconlyLight
                                                                    .user_1,
                                                                color: Grey1,
                                                              )),
                                                          hintText: "Divisi",
                                                          hintStyle: heading6
                                                              .copyWith(
                                                                  color: Grey1,
                                                                  fontSize: 14 *
                                                                      textScale),
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none))),
                                          popupProps: PopupProps.menu(
                                            constraints: BoxConstraints(
                                                maxHeight: bodyHeight * 0.18),
                                            scrollbarProps: ScrollbarProps(
                                                trackVisibility: true,
                                                trackColor: dark),
                                            fit: FlexFit.loose,
                                            menuProps: MenuProps(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                            ),
                                            containerBuilder:
                                                (ctx, popupWidget) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: light,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    0, 0.5),
                                                                blurRadius: 1,
                                                                color: dark
                                                                    .withOpacity(
                                                                        0.5))
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                      'Masuk',
                                      textScaleFactor: 1.3,
                                      style:
                                          headingBtn.copyWith(color: Yellow1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom *
                                        0.4))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return LoadingView();
              }
            }),
      ),
    );
  }
}
