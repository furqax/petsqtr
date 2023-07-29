import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/screens/ShCartFragment.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';

class ShCartScreen extends StatefulWidget {
  static String tag = '/ShCartScreen';

  @override
  ShCartScreenState createState() => ShCartScreenState();
}

class ShCartScreenState extends State<ShCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sh_lbl_account, style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
      ),
      body: ShCartFragment(),
    );
  }
}
