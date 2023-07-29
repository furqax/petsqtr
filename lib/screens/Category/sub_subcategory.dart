import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/models/ShCategory.dart';
import 'package:juber_car_booking/models/ShProduct.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';
import 'package:juber_car_booking/utils/ShExtension.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';
import 'package:juber_car_booking/utils/ShWidget.dart';

import '../../api-handler/env_constants.dart';
import '../../models/alldatacategory.dart';
import '../../models/categorywithsub.dart';
import '../ShViewAllProducts.dart';
import '../../models/alldatacategory.dart';

// ignore: must_be_immutable
class SubSubCategory extends StatefulWidget {
  // static String tag = '/SubSubCategory';
  Categories? category;

  SubSubCategory({this.category});

  @override
  SubSubCategoryState createState() => SubSubCategoryState();
}

class SubSubCategoryState extends State<SubSubCategory> {
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
          widget.category!.nameEng,
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
              itemCount: widget.category!.subcategory.length,
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: sh_colorPrimary.withOpacity(0.2),
                      )),
                      // color: Colors.amberAccent,
                      child: Image.network(
                        "${EnvironmentConstants.imageurl}${widget.category!.subcategory[index].image}",
                        width: 170,
                        height: 170,
                        // color: sh_white,
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: width * 0.035,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: sh_colorPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "${widget.category!.subcategory![index].nameEng!}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).onTap(() {
                  // SubSubCategory(category: widget.category!.subcategories![index])
                  //     .launch(context);
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
