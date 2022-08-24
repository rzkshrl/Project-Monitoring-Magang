import 'package:get/get.dart';

import '../controllers/edit_emailpass_h_r_controller.dart';

class EditEmailpassHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailpassHRController>(
      () => EditEmailpassHRController(),
    );
  }
}
