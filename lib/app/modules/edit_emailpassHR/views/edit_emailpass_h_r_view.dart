import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_emailpass_h_r_controller.dart';

class EditEmailpassHRView extends GetView<EditEmailpassHRController> {
  const EditEmailpassHRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditEmailpassHRView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditEmailpassHRView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
