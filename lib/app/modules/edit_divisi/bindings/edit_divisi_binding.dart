import 'package:get/get.dart';

import '../controllers/edit_divisi_controller.dart';

class EditDivisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDivisiController>(
      () => EditDivisiController(),
    );
  }
}
