import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/models/alldatacategory.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shopify_flutter/models/src/shopify_user/shopify_user.dart';
import 'package:shopify_flutter/shopify/src/shopify_auth.dart';

import '../api-handler/api-repo.dart';
import '../helper/util.dart';
import '../models/collection_product.dart';
import '../models/productdetail.dart';
import '../screens/Product/productlist.dart';

class AuthController extends GetxController {
  ApiRepository apiRepository;
  AuthController(this.apiRepository);

  @override
  void onInit() {}

  @override
  void onReady() async {
    super.onReady();
  }

  var signupdata = {
    "customer": {
      // "id": 1073339478,
      "email": "test@gmail.com",
      "accepts_marketing": false,
      "created_at": DateTime.now(),
      "updated_at": DateTime.now(),
      "first_name": "Steve",
      "last_name": "Lastnameson",
      "orders_count": 0,
      "state": "disabled",
      "total_spent": "0.00",
      "last_order_id": null,
      "note": null,
      "verified_email": true,
      "multipass_identifier": null,
      "tax_exempt": false,
      "phone": "+",
      "tags": "",
      "last_order_name": null,
      "currency": "Qtr"
    }
  };
  @override
  void onClose() {}
  ShopifyAuth shopifyAuth = ShopifyAuth.instance;
  Future<bool> signup(
      String email, String password, String firstname, String lastname) async {
    EasyLoading.show();
    try {
      shopifyAuth
          .createUserWithEmailAndPassword(
              email: "testcode@gmail.com",
              password: "12345678",
              firstName: "firstname",
              lastName: "lastname")
          .then((value) {
        print("valueeee${value.email.toString() == ""}");
        if (value.email.toString() != "") {
          showSnackBarTwo(
              'Signup', 'Account Create Successfully ', sh_colorPrimary);
        }
        EasyLoading.dismiss();

        return true;
      }).catchError((onError) {
        EasyLoading.dismiss();

        showSnackBarTwo('Signup', 'Something went wrong try again', sh_red);
      });
      ;
    } catch (e) {
      print("errerr $e");
      return false;
    }

    EasyLoading.dismiss();

    return false;
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    EasyLoading.show();
    shopifyAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // print("valueeee${value.email}");
      if (value.email.toString() != "") {
        showSnackBarTwo('Login', 'UserLogin', sh_colorPrimary);
      }

      EasyLoading.dismiss();

      return true;
    }).catchError((onError) {
      showSnackBarTwo('Login', 'Something went wrong try again', sh_red);
    });
    ;
    EasyLoading.dismiss();

    return false;
  }
}
