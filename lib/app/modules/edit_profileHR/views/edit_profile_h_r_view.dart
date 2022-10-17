import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/edit_profile/controllers/edit_profile_controller.dart';

import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/theme/theme.dart';
import 'package:project_magang/app/utils/loading.dart';

import '../../edit_divisi_HR/views/edit_divisi_h_r_view.dart';
import '../controllers/edit_profile_h_r_controller.dart';

class EditProfileHRView extends GetView<EditProfileHRController> {
  EditProfileHRView({Key? key}) : super(key: key);
  final EditProfileHRController controller = Get.put(EditProfileHRController());

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    log("$user");
    return FutureBuilder<DocumentSnapshot<Object?>>(
      future: controller.getUserDoc(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          var nama = controller.nameC.text = user['name'];
          controller.nomorindukC.text = user['nomor_induk'];
          String defaultImage =
              "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: light,
            body: LayoutBuilder(builder: (context, constraint) {
              final textScale = MediaQuery.of(context).textScaleFactor;
              double bodyHeight = constraint.maxHeight;
              double bodyWidth = constraint.maxWidth;
              return SingleChildScrollView(
                reverse: true,
                padding: EdgeInsets.only(
                  left: bodyWidth * 0.05,
                  right: bodyWidth * 0.05,
                  bottom: bodyHeight * 0.01,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: dark,
                            )),
                        SizedBox(
                          width: bodyWidth * 0.5,
                        ),
                        FocusedMenuHolder(
                          onPressed: () {},
                          menuItems: [
                            FocusedMenuItem(
                                title: Text("Edit Profil"),
                                onPressed: () {},
                                trailingIcon: Icon(IconlyLight.profile),
                                backgroundColor: Yellow1),
                            FocusedMenuItem(
                                title: Text(
                                  "Edit Divisi",
                                ),
                                onPressed: () => Get.to(EditDivisiHRView()),
                                trailingIcon: Icon(IconlyLight.user_1),
                                backgroundColor: Yellow1),
                          ],
                          blurBackgroundColor: Grey1,
                          blurSize: 0,
                          openWithTap: true,
                          menuOffset: bodyHeight * 0.02,
                          menuWidth: bodyWidth * 0.9,
                          animateMenuItems: false,
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Icon(IconlyLight.filter, color: dark),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: bodyHeight * 0.04),
                    Column(
                      children: [
                        Stack(
                          children: [
                            GetBuilder<EditProfileHRController>(
                              builder: (c) {
                                if (c.image != null) {
                                  return Center(
                                    child: ClipOval(
                                      child: Container(
                                        width: bodyWidth * 0.46,
                                        height: bodyHeight * 0.22,
                                        color: Colors.grey.shade200,
                                        child: Image.file(
                                          File(c.image!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: ClipOval(
                                      child: Container(
                                        width: bodyWidth * 0.46,
                                        height: bodyHeight * 0.22,
                                        color: Colors.grey.shade200,
                                        child: Image.network(
                                          user["profile"] != null
                                              ? user["profile"] != ""
                                                  ? user["profile"]
                                                  : defaultImage
                                              : defaultImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            //button untuk ganti foto profil
                            Positioned(
                              top: bodyHeight * 0.16,
                              left: bodyWidth * 0.55,
                              child: ClipOval(
                                child: Material(
                                  color: backgroundBlue,
                                  child: IconButton(
                                    onPressed: () {
                                      controller.pickImage();
                                    },
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
                          key: controller.namaKey.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: bodyWidth * 1,
                                height: bodyHeight * 0.065,
                                decoration: BoxDecoration(
                                    color: Yellow1,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  style: TextStyle(color: dark),
                                  controller: controller.nameC,
                                  // key: _nama,
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: Icon(
                                            IconlyLight.profile,
                                            color: Blue1,
                                          )),
                                      hintText: 'Nama',
                                      hintStyle: heading6.copyWith(
                                          color: Grey2,
                                          fontSize: 14 * textScale),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: bodyHeight * 0.025,
                        ),
                        Form(
                          key: controller.nomorIndukKey.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: bodyWidth * 1,
                                height: bodyHeight * 0.065,
                                decoration: BoxDecoration(
                                    color: Yellow1,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  autocorrect: false,
                                  controller: controller.nomorindukC,
                                  // onTap: () {
                                  //   FocusScopeNode currentFocus =
                                  //       FocusScope.of(context);

                                  //   if (!currentFocus.hasPrimaryFocus) {
                                  //     currentFocus.unfocus();
                                  //   }
                                  // },
                                  style: TextStyle(color: dark),
                                  decoration: InputDecoration(
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: Icon(
                                            IconlyLight.info_square,
                                            color: Blue1,
                                          )),
                                      hintText: 'Nomor Induk',
                                      hintStyle: heading6.copyWith(
                                          color: Grey2,
                                          fontSize: 14 * textScale),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ],
                          ),
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
                            onPressed: () => controller.editProfil(
                              controller.nameC.text,
                              controller.nomorindukC.text,
                            ),
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
              );
            }),
          );
        } else {
          return LoadingView();
        }
      },
    );
  }
}
