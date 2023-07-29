import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/models/ShProduct.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';

import '../../api-handler/env_constants.dart';
import '../../controller/home_controller.dart';
import '../../models/alldatacategory.dart';
import '../Product/productlist.dart';

// ignore: must_be_immutable
class Brands extends StatefulWidget {
  // static String tag = '/Brands';

  @override
  BrandsState createState() => BrandsState();
}

class BrandsState extends State<Brands> {
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  color: appStore.isDarkModeOn ? white : sh_textColorPrimary)),
        ],
        title: Text(
          "Brands",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: spacing_large,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.AllBrands.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: spacing_standard,
                crossAxisSpacing: spacing_standard,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    controller.AllBrands[index].image
                                .toString()
                                .toLowerCase() !=
                            "null"
                        ? Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   color: sh_colorPrimary.withOpacity(0.2),
                            // )),
                            // color: Colors.amberAccent,
                            child: Image.network(
                              "${EnvironmentConstants.brandimageurl}${controller.AllBrands[index].image.toString()}",
                              width: 170,
                              height: 170,
                              // color: sh_white,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: spacing_standard,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Center(
                        child: Text(
                          "${controller.AllBrands[index].nameEng}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).onTap(() {
                  controller
                      .getbrandsproducts(
                          controller.AllBrands[index].customId.toString())
                      .then((value) {
                    print(value);
                    if (value == true) {
                      // ProductList().launch(context);
                      Get.to(() => ProductList(
                          brandname:
                              controller.AllBrands[index].nameEng.toString()));
                    }
                  });
                });
              },
            ),
            SizedBox(height: spacing_standard_new),
          ],
        ),
      ),
    );
  }
}
