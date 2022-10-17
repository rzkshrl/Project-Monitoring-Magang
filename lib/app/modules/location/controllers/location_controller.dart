import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  //TODO: Implement LocationController

  // late GoogleMapController googleMapController;
  // final CameraPosition initialCameraPosition =
  //     CameraPosition(target: LatLng(1231313213123, 12321321312312));

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
