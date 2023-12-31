import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/screens/ShEmailScreen.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';
import 'package:juber_car_booking/utils/ShWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class ShContactUsScreen extends StatefulWidget {
  static String tag = '/ShContactUsScreen';

  @override
  ShContactUsScreenState createState() => ShContactUsScreenState();
}

class ShContactUsScreenState extends State<ShContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sh_lbl_contact_us, style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        actionsIconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                launch("tel:$sh_contact_phone");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_call_request, style: primaryTextStyle()),
                      Icon(Icons.keyboard_arrow_right,
                          color: appStore.isDarkModeOn
                              ? white
                              : sh_textColorPrimary),
                    ],
                  ),
                  Text(sh_contact_phone, style: secondaryTextStyle()),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            SizedBox(height: spacing_standard_new),
            InkWell(
              onTap: () {
                ShEmailScreen().launch(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_email, style: primaryTextStyle()),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color:
                            appStore.isDarkModeOn ? white : sh_textColorPrimary,
                      )
                    ],
                  ),
                  Text("Response within 24 business hours",
                      style: secondaryTextStyle()),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
