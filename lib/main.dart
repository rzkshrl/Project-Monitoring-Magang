import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/modules/login/views/login_view.dart';
import 'package:project_magang/app/modules/register/views/register_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProjectMagangApp());
}

class ProjectMagangApp extends StatelessWidget {
  const ProjectMagangApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: RegisterView(),
    ));
  }
}
