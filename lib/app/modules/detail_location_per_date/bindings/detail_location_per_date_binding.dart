import 'package:get/get.dart';

import '../controllers/detail_location_per_date_controller.dart';

class DetailLocationPerDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLocationPerDateController>(
      () => DetailLocationPerDateController(),
    );
  }
}
