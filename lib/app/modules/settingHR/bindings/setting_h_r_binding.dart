import 'package:get/get.dart';

import '../controllers/setting_h_r_controller.dart';

class SettingHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingHRController>(
      () => SettingHRController(),
    );
  }
}
