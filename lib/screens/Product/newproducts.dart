import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/screens/Category/sub_subcategory.dart';
import 'package:juber_car_booking/screens/Product/product_detail.dart';
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
import '../../models/Products.dart';
import '../../models/categorywithsub.dart';
import '../ShViewAllProducts.dart';

// ignore: must_be_immutable
class NewPriduct extends StatefulWidget {
  @override
  NewPriductState createState() => NewPriductState();
}

class NewPriductState extends State<NewPriduct> {
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
          "New Products",
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
              itemCount: controller.newproduct.length,
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
                        color: sh_black.withOpacity(0.2),
                      )),
                      // color: Colors.amberAccent,
                      child: controller.newproduct[index].images.length
                                  .toString() !=
                              "0"
                          ? CachedNetworkImage(
                              width: 170,
                              height: 170,
                              imageUrl:
                                  "${controller.newproduct[index].images[0].src}",
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                color: sh_colorPrimary,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Image.asset(
                              "images/pets/notfound.png",
                              width: 170,
                              height: 170,
                              // color: sh_white,
                            ),
                      //  Image.network(
                      //   "${controller.newproduct[index].images[0].src}",
                      //   width: 170,
                      //   height: 170,
                      //   // color: sh_white,
                      // ),
                    ),
                    SizedBox(
                      height: spacing_standard,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 160,
                                child: Text(
                                  "${controller.newproduct[index].title.toString().toUpperCase()}",
                                  style: TextStyle(
                                    color: sh_black,
                                    fontSize: 15.0,

                                    // fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ).onTap(() {
                  print("tap");
                  Get.put(ProductListController(Get.find()));
                  ProductListController productcontroller =
                      Get.find<ProductListController>();

                  productcontroller
                      .getproductsdetail(
                          controller.newproduct[index].id.toString())
                      .then((value) {
                    if (value == true) {
                      ProductDetailPage(
                              // product: controller.newproduct[index],
                              )
                          .launch(context);
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
