import 'package:get/get.dart';

import '../controllers/list_location_h_r_controller.dart';

class ListLocationHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListLocationHRController>(
      () => ListLocationHRController(),
    );
  }
}
