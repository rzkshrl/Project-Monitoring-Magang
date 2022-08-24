import 'package:get/get.dart';

class HomeHRController extends GetxController {
  // final _pageController = PageController(initialPage: 0);

  var tabIndex = 0.obs;

  void changeTabIndex(index) {
    tabIndex.value = index;
    update();
    // _pageController.animateToPage(index,
    //     duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

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
