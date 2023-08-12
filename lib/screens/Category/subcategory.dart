import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/screens/Category/sub_subcategory.dart';
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
import '../../controller/home_controller.dart';
import '../../controller/product_list_controller.dart';
import '../../models/alldatacategory.dart';
import '../../models/categorywithsub.dart';
import '../Product/product_detail.dart';
import '../Product/productlist.dart';
import '../ShViewAllProducts.dart';

// ignore: must_be_immutable
class SubCategory extends StatefulWidget {
  // static String tag = '/SubCategory';
  Department? category;

  SubCategory({this.category});

  @override
  SubCategoryState createState() => SubCategoryState();
}

class SubCategoryState extends State<SubCategory> {
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
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.search,
        //           color: appStore.isDarkModeOn ? white : sh_textColorPrimary)),
        // ],
        title: Text(
          widget.category!.nameEng!,
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
              itemCount: widget.category!.category.length,
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
                      child: CachedNetworkImage(
                        width: 170,
                        height: 170,
                        imageUrl:
                            "${EnvironmentConstants.imageurl}${widget.category!.category![index].image!}",
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: sh_colorPrimary,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Center(
                            child: Text(
                              "${widget.category!.category![index].nameEng.toString().toUpperCase()}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).onTap(() {
                  print(widget.category!.category![index].subcategory!.length);
                  if (widget.category!.category![index].subcategory!.length !=
                      0) {
                    SubSubCategory(category: widget.category!.category![index])
                        .launch(context);
                  } else {
                    controller
                        .getbrandsproducts(widget
                            .category!.category![index].customId
                            .toString())
                        .then((value) {
                      print(value);
                      if (value == true) {
                        // ProductList().launch(context);
                        Get.to(() => ProductList(
                            brandname: widget.category!.category![index].nameEng
                                .toString()));
                      }
                    });
                  }
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
