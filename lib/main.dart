import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(ProjectMagangApp());
}

class ProjectMagangApp extends StatelessWidget {
  const ProjectMagangApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ));
  }
}
