import 'package:get/get.dart';

import '../controllers/detail_location_h_r_controller.dart';

class DetailLocationHRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLocationHRController>(
      () => DetailLocationHRController(),
    );
  }
}
