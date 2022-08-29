import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

import 'menu_item.dart';

class MenuItemsAtt {
  static const List<MenuItemAtt> item = [itemAttendanceMe, itemAttendanceList];
  static const itemAttendanceMe =
      MenuItemAtt(text: "Absensi Saya", icon: IconlyLight.profile);
  static const itemAttendanceList =
      MenuItemAtt(text: "Absensi Karyawan", icon: IconlyLight.user_1);
}
