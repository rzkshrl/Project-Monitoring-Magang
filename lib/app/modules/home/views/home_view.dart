import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_magang/app/theme/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/icons/icon.png',
            fit: BoxFit.cover,
            width: 165,
            height: 30,
          ),
          centerTitle: true,
          backgroundColor: Blue1,
        ),
        body: ListView(padding: EdgeInsets.all(20), children: [
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
                        "Welcome, ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "ARIEL SIMANJUTAK",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Have a nice day",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Grey1, borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Check In",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(" - ", style: TextStyle(fontSize: 22))
                    ],
                  ),
                  Container(width: 2, height: 55, color: dark),
                  Column(
                    children: [
                      Text("Check Out", style: TextStyle(fontSize: 22)),
                      Text(" - ", style: TextStyle(fontSize: 22))
                    ],
                  )
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Grey1,
            thickness: 2,
          ),
          Row(
            children: [
              Container(
                height: 102,
                width: 164,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Blue1,
                    border: Border.all(width: 5.0, color: Yellow1)),
                child: InkWell(
                  onTap: () {},
                  /*authC.login(emailC.text, passC.text)*/
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Attendance",
                        style: headingBtn.copyWith(color: Yellow1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
