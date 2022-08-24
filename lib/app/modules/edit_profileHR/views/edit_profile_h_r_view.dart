import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_h_r_controller.dart';

class EditProfileHRView extends GetView<EditProfileHRController> {
  const EditProfileHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfileHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditProfileHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
