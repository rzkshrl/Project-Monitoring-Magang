import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  LocationView({Key? key}) : super(key: key);
  final LocationController controller = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
