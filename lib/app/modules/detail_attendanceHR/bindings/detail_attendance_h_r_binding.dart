import 'package:get/get.dart';

import '../controllers/detail_attendance_h_r_controller.dart';

class DetailAttendanceHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAttendanceHRController>(
      () => DetailAttendanceHRController(),
    );
  }
}
