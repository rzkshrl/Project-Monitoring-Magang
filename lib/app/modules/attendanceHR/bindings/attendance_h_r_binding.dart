import 'package:get/get.dart';

import '../controllers/attendance_h_r_controller.dart';

class AttendanceHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceHRController>(
      () => AttendanceHRController(),
    );
  }
}
