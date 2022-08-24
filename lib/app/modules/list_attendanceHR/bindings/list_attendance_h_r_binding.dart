import 'package:get/get.dart';

import '../controllers/list_attendance_h_r_controller.dart';

class ListAttendanceHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAttendanceHRController>(
      () => ListAttendanceHRController(),
    );
  }
}
