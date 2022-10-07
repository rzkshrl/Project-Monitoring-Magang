import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../../../utils/loading.dart';
import '../controllers/list_location_h_r_controller.dart';

class ListLocationHRView extends GetView<ListLocationHRController> {
  ListLocationHRView({Key? key}) : super(key: key);
  final ListLocationHRController controller =
      Get.put(ListLocationHRController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: light,
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamDataUsers(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.active) {
              var listAllDocs = snap.data!.docs;

              return LayoutBuilder(
                builder: (context, constraints) {
                  final textScale = MediaQuery.of(context).textScaleFactor;
                  final bodyHeight = MediaQuery.of(context).size.height;
                  -MediaQuery.of(context).padding.top;
                  final bodyWidth = MediaQuery.of(context).size.width;
                  return SingleChildScrollView(
                    reverse: false,
                    padding: EdgeInsets.only(
                      left: bodyWidth * 0.05,
                      right: bodyWidth * 0.05,
                      bottom: bodyHeight * 0.01,
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
                        Container(
                          width: bodyWidth * 1,
                          height: bodyHeight * 0.065,
                          decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            style: TextStyle(color: dark),
                            decoration: InputDecoration(
                                prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      IconlyLight.search,
                                      color: Grey1,
                                    )),
                                hintText: 'Cari',
                                hintStyle: heading6.copyWith(
                                    color: Grey1, fontSize: 14 * textScale),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listAllDocs.length,
                            // itemCount: 20,
                            itemBuilder: (context, index) {
                              var nama = {
                                (listAllDocs[index].data()
                                    as Map<String, dynamic>)["name"]
                              };
                              var defaultImage =
                                  "https://ui-avatars.com/api/?name=${nama}&background=fff38a&color=5175c0&font-size=0.33";
                              return Padding(
                                padding:
                                    EdgeInsets.only(bottom: bodyHeight * 0.015),
                                child: Material(
                                  color: Yellow1,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    // onTap: () => Get.toNamed(
                                    //     Routes.DETAIL_ATTENDANCE_H_R,
                                    //     arguments: listAllDocs[index].data()),
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: bodyWidth * 1,
                                      height: bodyHeight * 0.065,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: bodyWidth * 0.06,
                                                left: bodyWidth * 0.06),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}",
                                                  textAlign: TextAlign.start,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Visibility(
                                                  child: Text(
                                                      "${(listAllDocs[index].data() as Map<String, dynamic>)["uid"]}"),
                                                  visible: false,
                                                ),
                                                Text(
                                                  "${(listAllDocs[index].data() as Map<String, dynamic>)["divisi"]}",
                                                  textAlign: TextAlign.start,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                // Text(
                                                //   "w",
                                                //   textAlign: TextAlign.start,
                                                //   textScaleFactor: 1,
                                                //   style: TextStyle(
                                                //     fontWeight: FontWeight.w500,
                                                //   ),
                                                // ),
                                                // Text(
                                                //   "a",
                                                //   textAlign: TextAlign.start,
                                                //   textScaleFactor: 1,
                                                //   style: TextStyle(
                                                //     fontWeight: FontWeight.w500,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom *
                                        0.4))
                      ],
                    ),
                  );
                },
              );
            } else {
              return LoadingView();
            }
          }),
    );
  }
}
