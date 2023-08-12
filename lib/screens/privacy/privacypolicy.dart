import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/screens/privacy/privacydetail.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/models/ShProduct.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';

import '../../../api-handler/env_constants.dart';
import '../../../controller/home_controller.dart';
import '../../../models/alldatacategory.dart';

// ignore: must_be_immutable
class PrivacyPolicy extends StatefulWidget {
  // static String tag = '/PrivacyPolicy';

  @override
  BrandsState createState() => BrandsState();
}

class BrandsState extends State<PrivacyPolicy> {
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        title: Text(
          "Privacy Policy",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: spacing_large,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.privacy.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    getDrawerItem(null, controller.privacy[index].nameEng,
                        callback: () {
                      // Brands().launch(context);
                      PrivacyDetail(
                        privacy_detail: controller.privacy[index],
                      ).launch(context);
                    }),
                  ],
                );
              },
            ),
            SizedBox(height: spacing_standard_new),
          ],
        ),
      ),
    );
  }

  Widget getDrawerItem(String? icon, String? name, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        color: context.cardColor,
        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Row(
          children: <Widget>[
            icon == null ? Icon(Icons.privacy_tip) : Container(width: 20),
            SizedBox(width: 20),
            Text(name!,
                style: primaryTextStyle(
                    color: appStore.isDarkModeOn ? white : sh_textColorPrimary))
          ],
        ),
      ),
    );
  }
}
