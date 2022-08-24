import 'package:get/get.dart';

import '../controllers/home_h_r_controller.dart';

class HomeHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeHRController>(
      () => HomeHRController(),
    );
  }
}
