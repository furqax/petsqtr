import 'dart:convert';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/screens/ShSignIn.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/main.dart';
import 'package:juber_car_booking/models/ShCategory.dart';
import 'package:juber_car_booking/screens/ShAccountScreen.dart';
import 'package:juber_car_booking/screens/ShCartFragment.dart';
import 'package:juber_car_booking/screens/ShContactUsScreen.dart';
import 'package:juber_car_booking/screens/ShFAQScreen.dart';
import 'package:juber_car_booking/screens/ShHomeFragment.dart';
import 'package:juber_car_booking/screens/ShOrderListScreen.dart';
import 'package:juber_car_booking/screens/ShProfileFragment.dart';
import 'package:juber_car_booking/screens/ShSearchScreen.dart';
import 'package:juber_car_booking/screens/ShSettingsScreen.dart';
import 'package:juber_car_booking/screens/ShWishlistFragment.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';
import 'package:juber_car_booking/utils/ShExtension.dart';
import 'package:juber_car_booking/utils/ShImages.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';
import 'package:juber_car_booking/utils/ShWidget.dart';

import '../api-handler/env_constants.dart';
import '../controller/home_controller.dart';
import '../models/Category.dart';
import 'Brands/brands.dart';
import 'Category/sub_subcategory.dart';
import 'Category/subcategory.dart';
import 'ShSubCategory.dart';

class ShHomeScreen extends StatefulWidget {
  static String tag = '/ShHomeScreen';

  @override
  ShHomeScreenState createState() => ShHomeScreenState();
}

class ShHomeScreenState extends State<ShHomeScreen> {
  List<ShCategory> list = [];
  var homeFragment = ShHomeFragment();
  var cartFragment = ShCartFragment();
  var wishlistFragment = ShWishlistFragment();
  var profileFragment = ShProfileFragment();
  late var fragments;
  var selectedTab = 0;
  var emailCont = TextEditingController();
  HomeController controller = Get.find<HomeController>();

  // final List<Category> _categories = [
  //   Category(
  //     name: 'Dogs',
  //     imagePath: "images/pets/homedog.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Dogs',
  //         imagePath: "images/pets/homedog.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Subcategory 1.2',
  //         imagePath: "images/pets/homedog.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'SubSubcategory 1.2.1',
  //               imagePath: "images/pets/homedog.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Subcategory 1.3',
  //         imagePath: "images/pets/homedog.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'SubSubcategory 1.3.1',
  //               imagePath: "images/pets/homedog.png"),
  //           SubSubcategory(
  //               name: 'SubSubcategory 1.3.2',
  //               imagePath: "images/pets/homedog.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Cats',
  //     imagePath: "images/pets/homecat.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Cats 1',
  //         imagePath: "images/pets/homecat.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Cats 1.2',
  //         imagePath: "images/pets/homecat.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Cats 1.2.1', imagePath: "images/pets/homecat.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Cats 1.3',
  //         imagePath: "images/pets/homecat.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Cats 1.3.1', imagePath: "images/pets/homecat.png"),
  //           SubSubcategory(
  //               name: 'Cats 1.3.2', imagePath: "images/pets/homecat.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Birds',
  //     imagePath: "images/pets/homebirds.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Birds 1',
  //         imagePath: "images/pets/homebirds.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Birds 1.2',
  //         imagePath: "images/pets/homebirds.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Birds 1.2.1', imagePath: "images/pets/homebirds.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Birds 1.3',
  //         imagePath: "images/pets/homecat.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Birds 1.3.1', imagePath: "images/pets/homebirds.png"),
  //           SubSubcategory(
  //               name: 'Birds 1.3.2', imagePath: "images/pets/homebirds.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Fish',
  //     imagePath: "images/pets/fish.jpg",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Fish 1',
  //         imagePath: "images/pets/fish.jpg",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Fish 1.2',
  //         imagePath: "images/pets/fish.jpg",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Birds 1.2.1', imagePath: "images/pets/fish.jpg"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Fish 1.3',
  //         imagePath: "images/pets/homecat.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Fish 1.3.1', imagePath: "images/pets/fish.jpg"),
  //           SubSubcategory(
  //               name: 'Fish 1.3.2', imagePath: "images/pets/fish.jpg"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Small Pet',
  //     imagePath: "images/pets/homesmallpets.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Small Pet 1',
  //         imagePath: "images/pets/homesmallpets.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Small Pet 1.2',
  //         imagePath: "images/pets/homesmallpets.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Small Pet 1.2.1',
  //               imagePath: "images/pets/homesmallpets.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Small Pet 1.3',
  //         imagePath: "images/pets/homesmallpets.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Small Pet 1.3.1',
  //               imagePath: "images/pets/homesmallpets.png"),
  //           SubSubcategory(
  //               name: 'Small Pet 1.3.2',
  //               imagePath: "images/pets/homesmallpets.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Reptiles',
  //     imagePath: "images/pets/reptiles.jpg",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Reptiles 1',
  //         imagePath: "images/pets/reptiles.jpg",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Reptiles 1.2',
  //         imagePath: "images/pets/reptiles.jpg",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Reptiles 1.2.1', imagePath: "images/pets/reptiles.jpg"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Reptiles 1.3',
  //         imagePath: "images/pets/reptiles.jpg",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Reptiles 1.3.1', imagePath: "images/pets/reptiles.jpg"),
  //           SubSubcategory(
  //               name: 'Reptiles 1.3.2', imagePath: "images/pets/reptiles.jpg"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Chicken',
  //     imagePath: "images/pets/chicken.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Chicken 1',
  //         imagePath: "images/pets/chicken.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Chicken 1.2',
  //         imagePath: "images/pets/chicken.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Chicken 1.2.1', imagePath: "images/pets/chicken.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Chicken 1.3',
  //         imagePath: "images/pets/chicken.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Chicken 1.3.1', imagePath: "images/pets/chicken.png"),
  //           SubSubcategory(
  //               name: 'Chicken 1.3.2', imagePath: "images/pets/chicken.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  //   Category(
  //     name: 'Live Stock',
  //     imagePath: "images/pets/livestock.png",
  //     subcategories: [
  //       Subcategory(
  //         name: 'Live Stock 1',
  //         imagePath: "images/pets/livestock.png",
  //         subSubcategories: [],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Live Stock 1.2',
  //         imagePath: "images/pets/livestock.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Live Stock 1.2.1',
  //               imagePath: "images/pets/livestock.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //       Subcategory(
  //         name: 'Live Stock 1.3',
  //         imagePath: "images/pets/livestock.png",
  //         subSubcategories: [
  //           SubSubcategory(
  //               name: 'Live Stock 1.3.1',
  //               imagePath: "images/pets/livestock.png"),
  //           SubSubcategory(
  //               name: 'Live Stock 1.3.2',
  //               imagePath: "images/pets/livestock.png"),
  //         ],
  //         isExpanded: false,
  //       ),
  //     ],
  //   ),
  // ];

  // List<bool> _isExpandedList = [];
  // List<List<bool>> _isSubcategoryExpandedList = [];
  @override
  void initState() {
    super.initState();
    fragments = [homeFragment, wishlistFragment, cartFragment, profileFragment];
    // _isExpandedList = List.generate(_categories.length, (index) => false);
    // _isExpandedList =
    //     List.generate(controller.AllDataList.length, (index) => false);

    // _isSubcategoryExpandedList = List.generate(
    //   controller.AllDataList.length,
    //   (categoryIndex) => List.generate(
    //       controller.AllDataList[categoryIndex].category.length,
    //       (index) => false),
    // );

    fetchData();
  }

  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        list.clear();
        list.addAll(categories);
      });
    }).catchError((error) {
      toasty(context, error);
    });
  }

  Future<List<ShCategory>> loadCategory() async {
    String jsonString =
        await loadContentAsset('assets/shophop_data/category.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List).map((i) => ShCategory.fromJson(i)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var title = "Home";

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
          actions: [
            IconButton(
              icon: Icon(Icons.search,
                  color: appStore.isDarkModeOn ? white : sh_colorPrimary),
              onPressed: () {
                ShSearchScreen().launch(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined,
                  color: appStore.isDarkModeOn ? white : sh_colorPrimary),
              onPressed: () {
                // ShSearchScreen().launch(context);
              },
            )
          ],
          title: Image.asset(ic_app_icon, width: width * 0.2),
          centerTitle: true,

          //  Text(title, style: boldTextStyle(size: 22)),
        ),
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            fragments[selectedTab],
            Container(
              height: 58,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Image.asset(bg_bottom_bar,
                      width: width,
                      height: double.infinity,
                      fit: BoxFit.fill,
                      color: context.cardColor),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        tabItem(0, sh_ic_home),
                        tabItem(1, sh_ic_heart),
                        tabItem(2, sh_ic_cart),
                        tabItem(3, sh_user),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: Obx(
          () => SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height,
            child: Drawer(
              elevation: 8,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 60, right: spacing_large),
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: spacing_standard,
                                      margin: EdgeInsets.all(spacing_control),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.0)),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage(ic_user),
                                            radius: 55),
                                      ),
                                    ),
                                    SizedBox(height: spacing_middle),
                                    Text(
                                      "Guest User",
                                      style: boldTextStyle(
                                          color: appStore.isDarkModeOn
                                              ? white
                                              : sh_textColorPrimary,
                                          size: 18),
                                    )
                                  ],
                                )),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: spacing_standard_new, top: 30),
                                  child: Icon(Icons.clear)))
                        ],
                      ),

                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        // itemCount: _categories.length,
                        itemCount: controller.AllDataList.length,

                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, categoryIndex) {
                          // bool hasSubcategories =
                          //     _categories[categoryIndex].subcategories.isNotEmpty;
                          bool hasSubcategories = controller
                              .AllDataList[categoryIndex].category.isNotEmpty;
                          return ExpansionPanelList(
                            elevation: 0,
                            expansionCallback:
                                (int panelIndex, bool isExpanded) {
                              setState(() {
                                controller.isExpandedList[categoryIndex] =
                                    !isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                isExpanded:
                                    controller.isExpandedList[categoryIndex],
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    leading: Image.network(
                                      "${EnvironmentConstants.imageurl}${controller.AllDataList[categoryIndex].image}",

                                      // _categories[categoryIndex].imagePath,
                                      width: 60,
                                      height: 60,
                                    ),
                                    title: Text(
                                            controller
                                                .AllDataList[categoryIndex]
                                                .nameEng
                                                .toUpperCase(),
                                            // _categories[categoryIndex]
                                            //     .name
                                            //     .toUpperCase(),
                                            style: primaryTextStyle(
                                                color: appStore.isDarkModeOn
                                                    ? white
                                                    : sh_textColorPrimary))
                                        .onTap(() {
                                      SubCategory(
                                              category: controller
                                                  .AllDataList[categoryIndex])
                                          .launch(context);
                                    }),
                                  );
                                },
                                body: hasSubcategories
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemCount: controller
                                            .AllDataList[categoryIndex]
                                            .category
                                            .length,
                                        itemBuilder:
                                            (context, subcategoryIndex) {
                                          // bool hasSubSubcategories =
                                          //     _categories[categoryIndex]
                                          //         .subcategories[subcategoryIndex]
                                          //         .subSubcategories
                                          //         .isNotEmpty;

                                          // _isSubcategoryExpandedList[categoryIndex]
                                          //         [subcategoryIndex] =
                                          //     _isSubcategoryExpandedList[
                                          //                 categoryIndex]
                                          //             [subcategoryIndex] &&
                                          //         hasSubSubcategories;
                                          bool hasSubSubcategories = controller
                                              .AllDataList[categoryIndex]
                                              .category[subcategoryIndex]
                                              .subcategory
                                              .isNotEmpty;

                                          controller.isSubcategoryExpandedList[
                                                      categoryIndex]
                                                  [subcategoryIndex] =
                                              controller.isSubcategoryExpandedList[
                                                          categoryIndex]
                                                      [subcategoryIndex] &&
                                                  hasSubSubcategories;
                                          if (!hasSubSubcategories) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: ListTile(
                                                title: Text(
                                                        controller
                                                            .AllDataList[
                                                                categoryIndex]
                                                            .category[
                                                                subcategoryIndex]
                                                            .nameEng,
                                                        style: primaryTextStyle(
                                                            color: appStore
                                                                    .isDarkModeOn
                                                                ? white
                                                                : sh_textColorPrimary)

                                                        // _categories[
                                                        //       categoryIndex]
                                                        //   .subcategories[subcategoryIndex]
                                                        //   .name
                                                        )
                                                    .onTap(() {
                                                  // SubSubCategory(
                                                  //         category: controller
                                                  //                 .AllDataList[
                                                  //                     categoryIndex]
                                                  //                 .category[
                                                  //             subcategoryIndex])
                                                  //     .launch(context);
                                                }),
                                              ),
                                            );
                                          }
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: ExpansionPanelList(
                                              elevation: 0,
                                              expansionCallback:
                                                  (int panelIndex,
                                                      bool isExpanded) {
                                                setState(() {
                                                  controller.isSubcategoryExpandedList[
                                                              categoryIndex]
                                                          [subcategoryIndex] =
                                                      !isExpanded;
                                                });
                                              },
                                              children: [
                                                ExpansionPanel(
                                                  isExpanded: controller
                                                              .isSubcategoryExpandedList[
                                                          categoryIndex]
                                                      [subcategoryIndex],
                                                  headerBuilder:
                                                      (context, isExpanded) {
                                                    return ListTile(
                                                      title: Text(
                                                              controller
                                                                  .AllDataList[
                                                                      categoryIndex]
                                                                  .category[
                                                                      subcategoryIndex]
                                                                  .nameEng,
                                                              style: primaryTextStyle(
                                                                  color: appStore
                                                                          .isDarkModeOn
                                                                      ? white
                                                                      : sh_textColorPrimary))
                                                          .onTap(() {
                                                        SubSubCategory(
                                                                category: controller
                                                                    .AllDataList[
                                                                        categoryIndex]
                                                                    .category[subcategoryIndex])
                                                            .launch(context);
                                                      }),
                                                    );
                                                  },
                                                  body: hasSubSubcategories
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              ClampingScrollPhysics(),
                                                          itemCount: controller
                                                              .AllDataList[
                                                                  categoryIndex]
                                                              .category[
                                                                  subcategoryIndex]
                                                              .subcategory
                                                              .length,
                                                          itemBuilder: (context,
                                                              subSubcategoryIndex) {
                                                            return ListTile(
                                                              leading:
                                                                  Container(
                                                                width: 0.9,
                                                                height: 24.0,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              // trailing: Divider(
                                                              //     height: 1,
                                                              //     color: Colors
                                                              //         .black),
                                                              title: Text(
                                                                  controller
                                                                      .AllDataList[
                                                                          categoryIndex]
                                                                      .category[
                                                                          subcategoryIndex]
                                                                      .subcategory[
                                                                          subSubcategoryIndex]
                                                                      .nameEng,
                                                                  style: primaryTextStyle(
                                                                      color: appStore
                                                                              .isDarkModeOn
                                                                          ? white
                                                                          : sh_textColorPrimary)),
                                                              onTap: () {
                                                                // Handle sub-subcategory tap here
                                                              },
                                                            );
                                                          },
                                                        )
                                                      : Center(
                                                          child: Text(
                                                              'No Sub-Subcategories Available'),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Text(
                                          'No Subcategories Available',
                                          style: TextStyle(color: sh_black),
                                        ),
                                      ),
                              ),
                            ],
                          );

                          // ExpansionPanelList(
                          //   elevation: 0,
                          //   expansionCallback: (int panelIndex, bool isExpanded) {
                          //     setState(() {
                          //       _isExpandedList[index] = !isExpanded;
                          //     });
                          //   },
                          //   children: [
                          //     ExpansionPanel(
                          //       isExpanded: _isExpandedList[index],
                          //       headerBuilder: (context, isExpanded) {
                          //         return ListTile(
                          //           leading: Image.asset(
                          //             _categories[index].imagePath,
                          //             width: 50,
                          //             height: 50,
                          //           ),
                          //           title: Text(_categories[index].name),
                          //         );
                          //       },
                          //       body: ListView.builder(
                          //         shrinkWrap: true,
                          //         physics: ClampingScrollPhysics(),
                          //         itemCount:
                          //             _categories[index].subcategories.length,
                          //         itemBuilder: (context, subindex) {
                          //           return ExpansionPanelList(
                          //             expansionCallback:
                          //                 (int panelIndex, bool isExpanded) {
                          //               setState(() {
                          //                 _categories[index]
                          //                     .subcategories[subindex]
                          //                     .isExpanded = !isExpanded;
                          //               });
                          //             },
                          //             children: [
                          //               ExpansionPanel(
                          //                 isExpanded: _categories[index]
                          //                     .subcategories[subindex]
                          //                     .isExpanded,
                          //                 headerBuilder: (context, isExpanded) {
                          //                   return ListTile(
                          //                     // leading: Image.asset(
                          //                     //   _categories[index]
                          //                     //       .subcategories[subindex]
                          //                     //       .imagePath,
                          //                     //   width: 40,
                          //                     //   height: 40,
                          //                     // ),
                          //                     title: Text(_categories[index]
                          //                         .subcategories[subindex]
                          //                         .name),
                          //                   );
                          //                 },
                          //                 body: ListView.builder(
                          //                   shrinkWrap: true,
                          //                   physics: ClampingScrollPhysics(),
                          //                   itemCount: _categories[index]
                          //                       .subcategories[subindex]
                          //                       .subSubcategories
                          //                       .length,
                          //                   itemBuilder: (context, subSubindex) {
                          //                     return ListTile(
                          //                       // leading: Image.asset(
                          //                       //   _categories[index]
                          //                       //       .subcategories[subindex]
                          //                       //       .subSubcategories[subSubindex]
                          //                       //       .imagePath,
                          //                       //   width: 30,
                          //                       //   height: 30,
                          //                       // ),
                          //                       title: Text(_categories[index]
                          //                           .subcategories[subindex]
                          //                           .subSubcategories[subSubindex]
                          //                           .name),
                          //                       onTap: () {
                          //                         // Handle sub-subcategory tap here
                          //                       },
                          //                     );
                          //                   },
                          //                 ),
                          //               ),
                          //             ],
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // );

                          //  getDrawerItem(
                          //   _categories[index].imagePath,
                          //   _categories[index].name,
                          //   callback: () {
                          //     // ShSubCategory(category: list[index]).launch(context);
                          //   },
                          // );
                        },
                      ),
                      Divider(color: sh_view_color, height: 1),
                      getDrawerItem(null, sh_lbl_allbrands, callback: () {
                        Brands().launch(context);
                      }),
                      Divider(color: sh_view_color, height: 1),
                      getDrawerItem(null, sh_lbl_arabic, callback: () {
                        // ShSettingsScreen().launch(context);
                      }),
                      Divider(color: sh_view_color, height: 1),
                      getDrawerItem(null, sh_lbl_english, callback: () {
                        // ShSettingsScreen().launch(context);
                      }),
                      Divider(color: sh_view_color, height: 1),
                      getDrawerItem(null, sh_lbl_login_in, callback: () {
                        ShSignIn().launch(context);
                        // ShSettingsScreen().launch(context);
                      }),
                      Divider(color: sh_view_color, height: 1),
                      SizedBox(height: 30),
                      // Divider(color: sh_view_color, height: 1),
                      SizedBox(height: 20),
                      getDrawerItem(sh_user_placeholder, sh_lbl_account,
                          callback: () {
                        // ShAccountScreen().launch(context);

                        /*bool isWishlist = launchScreen(context, ShAccountScreen.tag) ?? false;
                    if (isWishlist) {
                      selectedTab = 1;
                      setState(() {});
                    }*/
                      }),
                      getDrawerItem(sh_settings, sh_lbl_settings, callback: () {
                        ShSettingsScreen().launch(context);
                      }),
                      SizedBox(height: 20),
                      // getDrawerItem(null, sh_lbl_faq, callback: () {
                      //   ShFAQScreen().launch(context);
                      // }),
                      getDrawerItem(null, sh_lbl_contact_us, callback: () {
                        ShContactUsScreen().launch(context);
                      }),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: sh_colorPrimary.withOpacity(0.2)),
                        padding: EdgeInsets.all(24),
                        child: Column(
                          children: <Widget>[
                            Image.asset(ic_app_icon, width: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text("PETS",
                                    textColor: sh_textColorPrimary,
                                    fontSize: textSizeMedium,
                                    fontFamily: fontBold),
                                text("QTR",
                                    textColor: sh_colorPrimary,
                                    fontSize: textSizeMedium,
                                    fontFamily: fontBold),
                              ],
                            ),
                            4.height,
                            Text("v 1.0",
                                style: primaryTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? white
                                        : sh_textColorPrimary,
                                    size: 14))
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        selectedTab = pos;
        setState(() {});
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: selectedTab == pos
            ? BoxDecoration(
                shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.2))
            : BoxDecoration(),
        child: SvgPicture.asset(icon,
            width: 24,
            height: 24,
            color:
                selectedTab == pos ? sh_colorPrimary : sh_textColorSecondary),
      ),
    );
  }
}
