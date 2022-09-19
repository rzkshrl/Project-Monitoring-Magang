import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/utils/loading.dart';

import '../../../theme/theme.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/edit_emailpass_controller.dart';

class EditEmailpassView extends GetView<EditEmailpassController> {
  const EditEmailpassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getUserDoc(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            var nama = controller.nameC.text = user['name'];
            controller.emailC.text = user['email'];
            var defaultImage =
                "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";

            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: light,
              body: LayoutBuilder(
                builder: (context, constraint) {
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
                          children: [
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: dark,
                                ))
                          ],
                        ),
                        SizedBox(height: bodyHeight * 0.04),
                        Column(
                          children: [
                            Center(
                              child: ClipOval(
                                child: Container(
                                  width: bodyWidth * 0.46,
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
                            ),
                            //button untuk ganti foto profil

                            SizedBox(
                              height: bodyHeight * 0.08,
                            ),
                            Form(
                              key: controller.emailKey.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: bodyWidth * 1,
                                    height: bodyHeight * 0.065,
                                    decoration: BoxDecoration(
                                        color: Yellow1,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField(
                                      style: TextStyle(color: dark),
                                      controller: controller.emailC,
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: bodyHeight * 0.025,
                            ),
                            Form(
                              key: controller.currentpassKey.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () => Container(
                                      width: bodyWidth * 1,
                                      height: bodyHeight * 0.065,
                                      decoration: BoxDecoration(
                                          color: Yellow1,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextFormField(
                                        style: TextStyle(color: dark),
                                        onTap: () {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Form tidak boleh kosong";
                                        },
                                        obscureText:
                                            controller.isPasswordHidden.value,
                                        controller: controller.currentpassC,
                                        decoration: InputDecoration(
                                            prefixIcon: Align(
                                                widthFactor: 1.0,
                                                heightFactor: 1.0,
                                                child: Icon(
                                                  IconlyLight.lock,
                                                  color: Grey1,
                                                )),
                                            hintText: 'Kata Sandi Saat Ini',
                                            hintStyle: heading6.copyWith(
                                                color: Grey1,
                                                fontSize: 14 * textScale),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              child: IconButton(
                                                color: Colors.black45,
                                                splashRadius: 1,
                                                icon: Icon(controller
                                                        .isPasswordHidden.value
                                                    ? Icons.visibility_rounded
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  controller.isPasswordHidden
                                                          .value =
                                                      !controller
                                                          .isPasswordHidden
                                                          .value;
                                                },
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: bodyHeight * 0.025,
                            ),
                            Form(
                              key: controller.newpassKey.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () => Container(
                                      width: bodyWidth * 1,
                                      height: bodyHeight * 0.065,
                                      decoration: BoxDecoration(
                                          color: Yellow1,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextFormField(
                                        style: TextStyle(color: dark),
                                        onTap: () {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Form tidak boleh kosong";
                                        },
                                        obscureText:
                                            controller.isPasswordHidden1.value,
                                        controller: controller.newpassC,
                                        decoration: InputDecoration(
                                            prefixIcon: Align(
                                                widthFactor: 1.0,
                                                heightFactor: 1.0,
                                                child: Icon(
                                                  IconlyLight.lock,
                                                  color: Grey1,
                                                )),
                                            hintText: 'Kata Sandi Baru',
                                            hintStyle: heading6.copyWith(
                                                color: Grey1,
                                                fontSize: 14 * textScale),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              child: IconButton(
                                                color: Colors.black45,
                                                splashRadius: 1,
                                                icon: Icon(controller
                                                        .isPasswordHidden1.value
                                                    ? Icons.visibility_rounded
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  controller.isPasswordHidden1
                                                          .value =
                                                      !controller
                                                          .isPasswordHidden1
                                                          .value;
                                                },
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  )
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
                                onPressed: () {
                                  controller
                                      .updatePass(controller.newpassC.text);
                                },
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
                                    MediaQuery.of(context).viewInsets.bottom *
                                        1))
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return LoadingView();
          }
        });
  }
}
