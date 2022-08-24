import 'package:get/get.dart';

import '../controllers/edit_profile_h_r_controller.dart';

class EditProfileHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileHRController>(
      () => EditProfileHRController(),
    );
  }
}
