import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../theme/theme.dart';
import '../../../utils/loading.dart';
import '../controllers/detail_location_per_date_controller.dart';

class DetailLocationPerDateView
    extends GetView<DetailLocationPerDateController> {
  DetailLocationPerDateView({Key? key}) : super(key: key);
  final DetailLocationPerDateController controller =
      Get.put(DetailLocationPerDateController());

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    log("${user}");
    var uid = user['uid'];
    var todayDate = user['todayDate'];
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamTodayLocationUser(uid, todayDate),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return LoadingView();
            }
            Map<String, dynamic>? dataToday = snap.data?.data();
            return LayoutBuilder(
              builder: (context, constraints) {
                final textScale = MediaQuery.of(context).textScaleFactor;
                final bodyHeight = MediaQuery.of(context).size.height;
                -MediaQuery.of(context).padding.top;
                final bodyWidth = MediaQuery.of(context).size.width;
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: bodyWidth * 0.05,
                    right: bodyWidth * 0.05,
                    bottom: bodyHeight * 0.02,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: bodyHeight * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: dark,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: bodyHeight * 0.01,
                      ),
                      Material(
                        color: Grey1,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          // onTap: () => Get.toNamed(Routes.LOCATION),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: bodyHeight * 0.4,
                            width: bodyWidth * 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight * 0.03,
                      ),
                      Container(
                          height: bodyHeight * 0.42,
                          width: bodyWidth * 1,
                          padding: EdgeInsets.only(
                              left: bodyWidth * 0.06,
                              right: bodyWidth * 0.06,
                              top: bodyHeight * 0.03),
                          decoration: BoxDecoration(
                              color: Yellow1,
                              borderRadius: BorderRadius.circular(22)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.location,
                                    color: dark,
                                  ),
                                  SizedBox(
                                    width: bodyWidth * 0.02,
                                  ),
                                  Text(
                                    "Lokasi Awal",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: bodyHeight * 0.02,
                              ),
                              Text(
                                dataToday?['masuk'] != null
                                    ? "${dataToday?['masuk']['detailAddress']['street']}, ${dataToday?['masuk']['detailAddress']['subLocality']}, ${dataToday?['masuk']['detailAddress']['locality']}, ${dataToday?['masuk']['detailAddress']['subAdministrativeArea']}, \n${dataToday?['masuk']['detailAddress']['administrativeArea']}, ${dataToday?['masuk']['detailAddress']['country']}, ${dataToday?['masuk']['detailAddress']['postalCode']},"
                                    : "--",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  color: Grey2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: bodyHeight * 0.05,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.location,
                                    color: dark,
                                  ),
                                  SizedBox(
                                    width: bodyWidth * 0.02,
                                  ),
                                  Text(
                                    "Lokasi Akhir",
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: bodyHeight * 0.02,
                              ),
                              Text(
                                dataToday?['keluar'] != null
                                    ? "${dataToday?['keluar']['detailAddress']['street']}, ${dataToday?['keluar']['detailAddress']['subLocality']}, ${dataToday?['keluar']['detailAddress']['locality']}, ${dataToday?['keluar']['detailAddress']['subAdministrativeArea']}, \n${dataToday?['keluar']['detailAddress']['administrativeArea']}, ${dataToday?['keluar']['detailAddress']['country']}, ${dataToday?['keluar']['detailAddress']['postalCode']},"
                                    : "--",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  color: Grey2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
