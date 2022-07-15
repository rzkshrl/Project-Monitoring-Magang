import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/custom_icon_home_icons.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        title: Image.asset(
          'assets/icons/icon.png',
          fit: BoxFit.cover,
          width: 200,
          height: 35,
        ),
        centerTitle: true,
        backgroundColor: Blue1,
      ),
      body: FooterView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade200,
                  child: Center(child: Text("X")),
                  // child: Image.network(src),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ARIEL SIMANJUTAK",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(CustomIconHome.attendance, color: Yellow1, size: 38)
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "BackEnd Developer",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "arielsimanjutak@gmail.com",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column()
            ],
          ),
        ],
        footer: new Footer(
          backgroundColor: backgroundBlue,
          child: Container(),
        ),
        flex: 3,
      ),
    );
  }
}
