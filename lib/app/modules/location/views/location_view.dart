import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
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
              bottom: bodyHeight * 0.02,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.12,
                    ),
                    Container(
                      height: bodyHeight * 0.4,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Grey1,
                    ),
                    SizedBox(
                      height: bodyHeight * 0.04,
                    ),
                    Container(
                      height: bodyHeight * 0.45,
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          right: MediaQuery.of(context).size.width * 0.06,
                          top: bodyHeight * 0.03),
                      decoration: BoxDecoration(
                          color: Yellow1,
                          borderRadius: BorderRadius.circular(22)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lokasi",
                            textAlign: TextAlign.start,
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: bodyHeight * 0.02,
                          ),
                          Text(
                            "Gedung Asram Lt.2 Jl Ring Road Utara, Gg Pandega Rini II Manggung, Catur Tunggal, Kec Depok, Mlati, Sleman Regency, Special Region of Yogyakarta",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Masuk",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Keluar",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: bodyHeight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "- -",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  color: Grey2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                              ),
                              Text(
                                "- -",
                                textAlign: TextAlign.start,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                  color: Grey2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: bodyHeight * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: bodyHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Blue1,
                            ),
                            child: TextButton(
                              onPressed: () => {},
                              /*authC.logut(emailC.text, passC.text)*/
                              child: Text(
                                'Masuk',
                                textScaleFactor: 1.1,
                                style: headingBtn.copyWith(color: Yellow1),
                              ),
                            ),
                          ),
                        ],
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
