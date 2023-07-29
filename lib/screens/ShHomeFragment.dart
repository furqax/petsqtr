import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/models/ShCategory.dart';
import 'package:juber_car_booking/models/ShProduct.dart';
import 'package:juber_car_booking/screens/ShSubCategory.dart';
import 'package:juber_car_booking/screens/ShViewAllProducts.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';
import 'package:juber_car_booking/utils/ShExtension.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';
import 'package:juber_car_booking/utils/ShWidget.dart';
import 'package:juber_car_booking/utils/dots_indicator/src/dots_decorator.dart';
import 'package:juber_car_booking/utils/dots_indicator/src/dots_indicator.dart';

import '../api-handler/env_constants.dart';
import '../controller/home_controller.dart';
import '../models/categorywithsub.dart';
import 'Category/subcategory.dart';

class ShHomeFragment extends StatefulWidget {
  static String tag = '/ShHomeFragment';

  @override
  ShHomeFragmentState createState() => ShHomeFragmentState();
}

class ShHomeFragmentState extends State<ShHomeFragment> {
  // List<Category> list = [];
  List<String> banners = [];
  List<ShProduct> newestProducts = [];
  List<ShProduct> featuredProducts = [];
  var position = 0;
  var colors = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5];
  var searchCont = TextEditingController();
  HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // loadCategorywithsub().then((categories) {
    //   setState(() {
    //     list.clear();
    //     list.addAll(categories);
    //   });
    // }).catchError((error) {
    //   toasty(context, error);
    // });
    List<ShProduct> products = await loadProducts();
    List<ShProduct> featured = [];
    products.forEach((product) {
      if (product.featured!) {
        featured.add(product);
      }
    });
    List<String> banner = [];
    for (var i = 1; i < 7; i++) {
      banner
          .add("images/shophop/img/products/banners/b" + i.toString() + ".jpg");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: newestProducts.isNotEmpty
            ? SingleChildScrollView(
                child: Obx(
                () => Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height * 0.55,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            PageView.builder(
                              itemCount: controller.AllBanner.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                    "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[index].imgName.toString()}",
                                    width: width,
                                    height: height * 0.55,
                                    fit: BoxFit.cover);
                              },
                              onPageChanged: (index) {
                                setState(() {
                                  position = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: text(sh_lbl_browsebypets.toUpperCase(),
                            fontSize: textSizeLargeMedium,
                            fontFamily: fontFamilySecondaryGlobal,
                            textColor: sh_black,
                            bold: true),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.AllDataList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: spacing_standard,
                          crossAxisSpacing: spacing_standard,
                          childAspectRatio: 1,
                        ),
                        // padding: EdgeInsets.only(
                        //   left: spacing_standard,
                        //   right: spacing_standard,
                        // ),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              Container(
                                // color: Colors.amber,
                                width: 160,
                                height: 180,
                                margin: EdgeInsets.only(
                                    right: spacing_standard,
                                    left: spacing_standard),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 180,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // color: Colors.amberAccent,
                                                    child: Row(
                                                      mainAxisAlignment: index %
                                                                  2 ==
                                                              0
                                                          ? MainAxisAlignment
                                                              .start
                                                          : MainAxisAlignment
                                                              .end,
                                                      children: [
                                                        Image.network(
                                                          "${EnvironmentConstants.imageurl}${controller.AllDataList[index].image}",
                                                          width: 110,
                                                          height: 110,
                                                          // color: sh_white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: sh_colorPrimary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      child: ListTile(
                                                        title: Text(
                                                          "Products",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        trailing: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 80,
                                          right: index % 2 == 0 ? 0 : null,
                                          left: index % 2 != 0 ? 0 : null,
                                          child: text(
                                              controller
                                                  .AllDataList[index].nameEng
                                                  .toString()
                                                  .toUpperCase(),
                                              textColor: sh_black,
                                              fontSize: textSizeSMedium,
                                              fontFamily: fontBold,
                                              bold: true),
                                        ),
                                      ],
                                    ),

                                    // SizedBox(height: spacing_control),
                                    // text(
                                    //   list[index].name,
                                    //   textColor: colors[index % colors.length],
                                    //   fontFamily: fontMedium,
                                    // ),
                                  ],
                                ),
                              ).onTap(() {
                                SubCategory(
                                        category: controller.AllDataList[index])
                                    .launch(context);
                              }),
                            ],
                          );
                        },
                      ),
                      // Container(
                      //   height: 80,
                      //   margin: EdgeInsets.only(top: spacing_standard_new),
                      //   alignment: Alignment.topLeft,
                      //   child: ListView.builder(
                      //     itemCount: list.length,
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     padding: EdgeInsets.only(
                      //         left: spacing_standard, right: spacing_standard),
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Container(
                      //         margin: EdgeInsets.only(
                      //             left: spacing_standard,
                      //             right: spacing_standard),
                      //         child: Column(
                      //           children: <Widget>[
                      //             Container(
                      //               padding: EdgeInsets.all(spacing_middle),
                      //               decoration: BoxDecoration(
                      //                   // shape: BoxShape.circle,
                      //                   color: colors[index % colors.length]),
                      //               child: Image.asset(list[index].image!,
                      //                   width: 15, color: sh_white),
                      //             ),
                      //             SizedBox(height: spacing_control),
                      //             text(list[index].name,
                      //                 textColor: colors[index % colors.length],
                      //                 fontFamily: fontMedium)
                      //           ],
                      //         ),
                      //       ).onTap(() {
                      //         ShSubCategory(category: list[index])
                      //             .launch(context);
                      //       });
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: text(sh_lbl_new_product.toUpperCase(),
                            fontSize: textSizeLargeMedium,
                            fontFamily: fontFamilySecondaryGlobal,
                            textColor: sh_black,
                            bold: true),
                      ),
                      horizontalHeading(sh_lbl_newest_product, callback: () {
                        // ShViewAllProductScreen(
                        //         prodcuts: newestProducts,
                        //         title: sh_lbl_newest_product)
                        //     .launch(context);
                      }),
                      ProductHorizontalList(newestProducts),
                      SizedBox(height: spacing_standard_new),
                      // horizontalHeading(sh_lbl_Featured, callback: () {
                      //   ShViewAllProductScreen(
                      //           prodcuts: featuredProducts,
                      //           title: sh_lbl_Featured)
                      //       .launch(context);
                      // }),
                      // ProductHorizontalList(featuredProducts),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ))
            : Container(),
      ),
    );
  }
}
