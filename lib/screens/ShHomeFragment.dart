import 'package:cached_network_image/cached_network_image.dart';
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
import 'Brands/brands.dart';
import 'Category/subcategory.dart';
import 'Product/newproducts.dart';
import 'Product/productlist.dart';

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
          body: SingleChildScrollView(
              child: Obx(
        () => controller.AllDataList.isNotEmpty
            ? Container(
                width: double.infinity,
                // padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: height * 0.55,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              // PageView.builder(
                              //   itemCount: controller.AllBanner.length,
                              //   itemBuilder: (context, index) {
                              // return
                              CachedNetworkImage(
                                width: width,
                                height: height * 0.55,
                                imageUrl:
                                    "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[0].imgName.toString()}",
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: sh_colorPrimary,
                                )),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                              // Image.network(
                              //     "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[index].imgName.toString()}",
                              // width: width,
                              // height: height * 0.55,
                              //     fit: BoxFit.cover);
                              //   },
                              //   onPageChanged: (index) {
                              //     setState(() {
                              //       position = index;
                              //     });
                              //   },
                              // ),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                                        mainAxisAlignment:
                                                            index % 2 == 0
                                                                ? MainAxisAlignment
                                                                    .start
                                                                : MainAxisAlignment
                                                                    .end,
                                                        children: [
                                                          CachedNetworkImage(
                                                            width: 110,
                                                            height: 110,
                                                            imageUrl:
                                                                "${EnvironmentConstants.imageurl}${controller.AllDataList[index].image}",
                                                            placeholder: (context,
                                                                    url) =>
                                                                Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                              color:
                                                                  sh_colorPrimary,
                                                            )),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                          // Image.network(
                                                          //   "${EnvironmentConstants.imageurl}${controller.AllDataList[index].image}",
                                                          //   width: 110,
                                                          //   height: 110,
                                                          //   // color: sh_white,
                                                          // ),
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
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                          category:
                                              controller.AllDataList[index])
                                      .launch(context);
                                }),
                              ],
                            );
                          },
                        ),

                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            // mainAxisSpacing: spacing_standard,
                            // crossAxisSpacing: spacing_standard,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return controller.AllBanner.isNotEmpty
                                ? controller.AllBrands[index].image
                                            .toString()
                                            .toLowerCase() !=
                                        "null"
                                    ? InkWell(
                                        onTap: () {
                                          controller
                                              .getbrandsproducts(controller
                                                  .AllBrands[index].customId
                                                  .toString())
                                              .then((value) {
                                            print(value);
                                            if (value == true) {
                                              // ProductList().launch(context);
                                              Get.to(() => ProductList(
                                                  brandname: controller
                                                      .AllBrands[index].nameEng
                                                      .toString()));
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 100,
                                          // decoration: BoxDecoration(
                                          //     border: Border.all(
                                          //   color: sh_colorPrimary.withOpacity(0.2),
                                          // )),
                                          // color: Colors.amberAccent,
                                          child: CachedNetworkImage(
                                            width: 170,
                                            height: 170,
                                            imageUrl:
                                                "${EnvironmentConstants.brandimageurl}${controller.AllBrands[index].image.toString()}",
                                            placeholder: (context, url) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator(
                                              color: sh_colorPrimary,
                                            )),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          // Image.network(
                                          //   "${EnvironmentConstants.brandimageurl}${controller.AllBrands[index].image.toString()}",
                                          //   width: 170,
                                          //   height: 170,
                                          //   // color: sh_white,
                                          // ),
                                        ),
                                      )
                                    : Container()
                                : Container();
                          },
                        ),
                        Container(
                          color: sh_colorPrimary,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: text("See All Brands".toUpperCase(),
                                fontSize: textSizeSMedium,
                                fontFamily: fontFamilySecondaryGlobal,
                                textColor: sh_white,
                                bold: true),
                          ),
                        ).onTap(() {
                          Brands().launch(context);
                        }),
                        Stack(
                          children: [
                            CachedNetworkImage(
                              width: width,
                              height: height * 0.55,
                              imageUrl:
                                  "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[1].imgName.toString()}",
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                color: sh_colorPrimary,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: text(sh_lbl_new_product.toUpperCase(),
                              fontSize: textSizeLargeMedium,
                              fontFamily: fontFamilySecondaryGlobal,
                              textColor: sh_black,
                              bold: true),
                        ),
                        horizontalHeading(sh_lbl_newest_product, callback: () {
                          NewPriduct().launch(context);
                        }),

                        GetBuilder<HomeController>(
                          builder: (_) => ProductHorizontalList(),
                        ),

                        // SizedBox(height: spacing_standard_new),
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
                    CachedNetworkImage(
                      // width: width,
                      // height: height * 0.55,
                      imageUrl:
                          "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[2].imgName.toString()}",
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: sh_colorPrimary,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(height: 60),
                    Stack(
                      children: [
                        CachedNetworkImage(
                          // width: width,
                          // height: height * 0.55,
                          imageUrl:
                              "${EnvironmentConstants.bannerimageurl}${controller.AllBanner[3].imgName.toString()}",
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            color: sh_colorPrimary,
                          )),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 100, left: 30),
                        //   child: Container(
                        //     color: Colors.white,
                        //     height: 120,
                        //     // width: 150,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Text("""PETSQTR
                        //     Salwa Rd, Doha Near Jarir Bookshop

                        //     Saturday - Thursday, 10:00am - 10:00pm
                        //     Friday, 2:00am - 10:00pm"""),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              )
            : Container(),
      ))),
    );
  }
}
