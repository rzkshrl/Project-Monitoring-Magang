import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:iconly/iconly.dart';
import 'package:project_magang/app/modules/home/views/home_view.dart';
import 'package:project_magang/app/widgets/custom_icon_home_icons.dart';
import 'package:get/get.dart';
import 'package:project_magang/app/theme/theme.dart';
import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
      child: Scaffold(
        backgroundColor: light,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: bodyHeight * 0.01,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: bodyHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Blue1,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        /*authC.login(emailC.text, passC.text)*/
                        child: Icon(
                          IconlyLight.paper_plus,
                          color: Yellow1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
