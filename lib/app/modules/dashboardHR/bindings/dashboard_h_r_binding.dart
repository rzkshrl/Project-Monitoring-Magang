import 'package:get/get.dart';

import '../controllers/dashboard_h_r_controller.dart';

class DashboardHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardHRController>(
      () => DashboardHRController(),
    );
  }
}
