import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final emailC = TextEditingController();
  final passC = TextEditingController();
  final nameC = TextEditingController();
  final nomorindukC = TextEditingController();
  final divisiC = "".obs;

  final nameKey = GlobalKey<FormState>().obs;
  final emailKey = GlobalKey<FormState>().obs;
  final passKey = GlobalKey<FormState>().obs;
  final noIndukKey = GlobalKey<FormState>().obs;

  final nameValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom harus diisi"),
  ]);

  final emailValidator = MultiValidator([
    EmailValidator(errorText: "Email tidak valid"),
    RequiredValidator(errorText: "Kolom harus diisi"),
  ]);

  final noIndukValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom harus diisi"),
  ]);

  final divisiValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom harus diisi"),
  ]);

  final passValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom harus diisi"),
    MinLengthValidator(6, errorText: "Kata sandi kurang dari 6 karakter"),
  ]);

  var isPasswordHidden = true.obs;

  void setDivisi(String divisi) {
    divisiC.value = divisi;
    log(divisiC.value);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
