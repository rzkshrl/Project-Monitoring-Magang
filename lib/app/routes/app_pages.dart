import 'package:get/get.dart';

import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/attendance/views/attendance_view.dart';
import '../modules/attendanceHR/bindings/attendance_h_r_binding.dart';
import '../modules/attendanceHR/views/attendance_h_r_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboardHR/bindings/dashboard_h_r_binding.dart';
import '../modules/dashboardHR/views/dashboard_h_r_view.dart';
import '../modules/detail_locationHR/bindings/detail_location_h_r_binding.dart';
import '../modules/detail_locationHR/views/detail_location_h_r_view.dart';
import '../modules/edit_divisi/bindings/edit_divisi_binding.dart';
import '../modules/edit_divisi/views/edit_divisi_view.dart';
import '../modules/edit_divisi_HR/bindings/edit_divisi_h_r_binding.dart';
import '../modules/edit_divisi_HR/views/edit_divisi_h_r_view.dart';
import '../modules/edit_emailpass/bindings/edit_emailpass_binding.dart';
import '../modules/edit_emailpass/views/edit_emailpass_view.dart';
import '../modules/edit_emailpassHR/bindings/edit_emailpass_h_r_binding.dart';
import '../modules/edit_emailpassHR/views/edit_emailpass_h_r_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/edit_profileHR/bindings/edit_profile_h_r_binding.dart';
import '../modules/edit_profileHR/views/edit_profile_h_r_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_attendanceHR/bindings/list_attendance_h_r_binding.dart';
import '../modules/list_attendanceHR/views/list_attendance_h_r_view.dart';
import '../modules/list_locationHR/bindings/list_location_h_r_binding.dart';
import '../modules/list_locationHR/views/list_location_h_r_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupa_sandi/bindings/lupa_sandi_binding.dart';
import '../modules/lupa_sandi/views/lupa_sandi_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/settingHR/bindings/setting_h_r_binding.dart';
import '../modules/settingHR/views/setting_h_r_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_SANDI,
      page: () => LupaSandiView(),
      binding: LupaSandiBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => AttendanceView(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMAILPASS,
      page: () => EditEmailpassView(),
      binding: EditEmailpassBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_H_R,
      page: () => const DashboardHRView(),
      binding: DashboardHRBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE_H_R,
      page: () => const AttendanceHRView(),
      binding: AttendanceHRBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ATTENDANCE_H_R,
      page: () => const ListAttendanceHRView(),
      binding: ListAttendanceHRBinding(),
    ),
    GetPage(
      name: _Paths.LIST_LOCATION_H_R,
      page: () => const ListLocationHRView(),
      binding: ListLocationHRBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LOCATION_H_R,
      page: () => const DetailLocationHRView(),
      binding: DetailLocationHRBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_H_R,
      page: () => const SettingHRView(),
      binding: SettingHRBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMAILPASS_H_R,
      page: () => EditEmailpassHRView(),
      binding: EditEmailpassHRBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_H_R,
      page: () => EditProfileHRView(),
      binding: EditProfileHRBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DIVISI,
      page: () => EditDivisiView(),
      binding: EditDivisiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DIVISI_H_R,
      page: () => EditDivisiHRView(),
      binding: EditDivisiHRBinding(),
    ),
  ];
}
