import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/models/privacy.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/models/ShProduct.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';

import '../../../api-handler/env_constants.dart';
import '../../../controller/home_controller.dart';
import '../../../models/alldatacategory.dart';
import '../../utils/ShWidget.dart';

// ignore: must_be_immutable
class PrivacyDetail extends StatefulWidget {
  // static String tag = '/PrivacyDetail';
  Privacy? privacy_detail;
  PrivacyDetail({this.privacy_detail});
  @override
  BrandsState createState() => BrandsState();
}

class BrandsState extends State<PrivacyDetail> {
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
          "${widget.privacy_detail?.nameEng}",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                """${widget.privacy_detail?.descriptionEng.toString()}""",
                style: TextStyle(
                    color: sh_textColorSecondary,
                    fontSize: spacing_large - 5,
                    fontFamily: fontBold),
              ),
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
            icon != null
                ? Image.asset(
                    icon,
                    width: 20,
                    height: 20,
                    // color: appStore.isDarkModeOn ? white : black
                  )
                : Container(width: 20),
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
