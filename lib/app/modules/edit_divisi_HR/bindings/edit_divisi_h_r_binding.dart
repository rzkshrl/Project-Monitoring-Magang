import 'package:get/get.dart';

import '../controllers/edit_divisi_h_r_controller.dart';

class EditDivisiHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDivisiHRController>(
      () => EditDivisiHRController(),
    );
  }
}
