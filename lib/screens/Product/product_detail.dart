import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/controller/home_controller.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:juber_car_booking/utils/ShStrings.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../controller/cart.dart';
import '../../controller/product_list_controller.dart';
import '../../main.dart';
import '../../models/Products.dart';
import '../../models/productdetail.dart';
import '../../utils/ShConstant.dart';

class ProductDetailPage extends StatefulWidget {
  // final Product product;

  // ProductDetailPage({required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentImageIndex = 0;
  ProductListController productcontroller = Get.find<ProductListController>();
  HomeController homecontroller = Get.find<HomeController>();
  CartSharedPreferences cartSharedPreferences = CartSharedPreferences();
  var data;
  String? _selectedSize;
  int price = 0;
  List<ProductDetail> cartItems = [];
  void _selectSize(String? size, int index) {
    setState(() {
      _selectedSize = size;
      price = index;
    });
  }

  @override
  void initState() {
    _selectedSize =
        productcontroller.productdetail!.variants![price].barcode.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<ProductListController>();
    super.dispose();
  }

  double calculateDiscount(double originalPrice, double discountPercentage) {
    if (originalPrice <= 0 ||
        discountPercentage < 0 ||
        discountPercentage > 100) {
      throw ArgumentError(
          'Invalid input: originalPrice and discountPercentage must be positive numbers.');
    }

    double discountAmount = (originalPrice * discountPercentage) / 100;

    return discountAmount;
  }

  // void _addToCart() async {
  //   // Check if the product is already in the cart
  //   bool alreadyInCart =
  //       cartItems.any((item) => item.id == productcontroller.productdetail!.id);
  //   bool alreadyInCartoption = cartItems.any(
  //       (item) => item.options == productcontroller.productdetail!.options);

  //   if (!alreadyInCart) {
  //     cartItems.add(productcontroller.productdetail!);
  //     await cartSharedPreferences.saveCartItems(cartItems);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Added to cart')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Product is already in the cart')),
  //     );
  //   }
  // }
  void _addToCart() async {
    var productDetail = productcontroller.productdetail!;
    var existingCartItems = await cartSharedPreferences.loadCartItems();
    bool notfound = false;
    // print(existingCartItems);
    var existingCartItemIndex;
    // print(existingCartItemIndex);
    print(data);
    // Check if the product with the same options is already in the cart
    existingCartItemIndex = existingCartItems.indexWhere((item) =>
        item.id == productDetail.id &&
        listEquals(item.variants, productDetail.variants));
    for (int i = 0; i < existingCartItems.length; i++) {
      // print(i);
      // print(existingCartItems[i].toJson());
      if (existingCartItems[i].id.toString() ==
          productcontroller.productdetail!.id.toString()) {
        print(" matched");

        for (int j = 0; j < existingCartItems[i].quantity!.length; j++) {
          if (existingCartItems[i].quantity![j].id.toString() ==
              productDetail.quantity![j].id.toString()) {
            print("variant matched");
          }
        }

        // existingCartItems[existingCartItemIndex].quantity =
        //     existingCartItems[existingCartItemIndex].quantity! +
        //         productDetail.quantity!;
        notfound = true;
        print("matched");
      }
    }
    // print(existingCartItemIndex);
    // if (existingCartItemIndex != -1) {
    //   // Product with the same options exists in the cart, update its quantity
    //   existingCartItems[existingCartItemIndex].quantity =
    //       existingCartItems[existingCartItemIndex].quantity! +
    //           productDetail.quantity!;
    //   // existingCartItems[existingCartItemIndex].quantity +=
    //   //     productDetail.quantity!;
    // } else {
    // Product is not in the cart, add it with its quantity
    if (notfound == false) {
      // productDetail.quantity.add(value)

      existingCartItems.add(productDetail);
    }
    // }

    // await cartSharedPreferences.saveCartItems(existingCartItems);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        title: Text(
          'Product Details',
          style: TextStyle(
              color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(productcontroller.productdetail!.images[0].src.toString()),
              CarouselSlider(
                items: productImageSliders(),
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: productcontroller.productdetail!.images.map((url) {
                  int index =
                      productcontroller.productdetail!.images.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentImageIndex == index ? sh_black : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  productcontroller.productdetail!.title
                      .toString()
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              productcontroller.productdetail!.variants![price].compareAtPrice
                          .toString() !=
                      "null"
                  ? Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'QTR  ${productcontroller.productdetail!.variants![price].compareAtPrice.toString()}',
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100,
                            color:
                                Colors.black, // Customize the color of the line
                          ),
                        ],
                      ),
                    )
                  : Container(),
              // Text(
              //   calculateDiscount(
              //           double.parse(productcontroller
              //               .productdetail!.variants![price].compareAtPrice
              //               .toString()),
              //           double.parse(productcontroller
              //               .productdetail!.variants![price].price
              //               .toString()))
              //       .toString(),
              // ),
              // Center(
              //   child: Text(

              //     style: TextStyle(
              //       fontSize: 20,
              //       // color: sh_colorPrimary,
              //       // fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Center(
                child: Text(
                  'QTR  ${productcontroller.productdetail!.variants![price].price.toString()}',
                  style: TextStyle(
                    fontSize: 20,
                    // color: sh_colorPrimary,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Divider(
                height: 2,
                thickness: 1,
                color: sh_black.withOpacity(0.1),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  'Option 1'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              productcontroller.productdetail!.variants![0].title
                          .toString()
                          .toLowerCase() !=
                      "default title"
                  ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          productcontroller.productdetail!.variants!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          // mainAxisSpacing: spacing_standard,
                          // crossAxisSpacing: spacing_standard,
                          childAspectRatio: 1.5),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            data = {
                              "id": productcontroller
                                  .productdetail!.variants![index].id,
                              "productid": productcontroller.productdetail!.id,
                              "title": productcontroller.productdetail!.title,
                              "price": productcontroller
                                  .productdetail!.variants![price].price,
                              "sku": ""
                            };
                            _selectSize(
                                '${productcontroller.productdetail!.variants![index].title}',
                                index);
                          },
                          child: _buildSizeOption(
                              '${productcontroller.productdetail!.variants![index].title}'),
                        );
                      })
                  : Container(),

              SizedBox(height: height * 0.02),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: sh_black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ).onTap(() {
                    _addToCart();
                    // print(productcontroller.productdetail!.toJson());
                    // ProductDetail? newaddtocart =
                    //     productcontroller.productdetail;
                    // homecontroller.saveProductDetailsList(newaddtocart);
                    // print(newaddtocart);
                  }),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: sh_colorPrimary,
                      borderRadius: BorderRadius.circular(2),
                    ), // You can set any color you want
                    child: Center(
                      child: Text(
                        'Buy it now'.toUpperCase(),
                        style: TextStyle(fontSize: 16, color: sh_white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  ' Product Details : '.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Html(data: """${productcontroller.productdetail!.bodyHtml}"""),
              //         Text(
              //           """${productcontroller.productdetail!.bodyHtml}

              //              13101-3M(Upto24kg)
              //              13102-4M(Upto30kg)
              // """,
              //           maxLines: 5,
              //           overflow: TextOverflow.ellipsis,
              //         ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> productImageSliders() {
    return productcontroller.productdetail!.images.map((url) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(url.src.toString()),
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildSizeOption(String size) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedSize == size ? sh_colorPrimary : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _selectedSize == size ? sh_colorPrimary : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
