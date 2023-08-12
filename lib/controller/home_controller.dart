import 'package:get/get.dart';
import 'package:juber_car_booking/models/alldatacategory.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../api-handler/api-repo.dart';
import '../models/collection_product.dart';
import '../models/privacy.dart';
import '../models/productdetail.dart';
import '../screens/Product/productlist.dart';

class HomeController extends GetxController {
  ApiRepository apiRepository;
  HomeController(this.apiRepository);
  var AllDataList = List<Department>.empty(growable: true).obs;
  var AllBrands = List<Brand>.empty(growable: true).obs;
  var AllBanner = List<Slider>.empty(growable: true).obs;
  var brandproduct = List<Products>.empty(growable: true).obs;
  var newproduct = List<Products>.empty(growable: true).obs;

  var privacy = List<Privacy>.empty(growable: true).obs;
  String newproductcollectionid = "";
  List<bool> isExpandedList = [];
  List<List<bool>> isSubcategoryExpandedList = [];
  @override
  void onInit() {
    super.onInit();
    getalldata().then((value) {
      isExpandedList = List.generate(AllDataList.length, (index) => false);

      isSubcategoryExpandedList = List.generate(
        AllDataList.length,
        (categoryIndex) => List.generate(
            AllDataList[categoryIndex].category.length, (index) => false),
      );
    });
    masterdata();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> getalldata() async {
    try {
      EasyLoading.show();

      var response = await apiRepository.getalldata();
      if (response.data['department'].toString() != "[]") {
        List listData = response.data['department'];
        print("listData ${listData.length}");
        // print("parsing list : ${response.data['data']['data']}");
        var parsingList = listData.map((m) => Department.fromJson(m)).toList();

        AllDataList.addAll(parsingList); // add new items to your list
        for (int i = 0; i <= AllDataList.length; i++) {
          if (AllDataList[i].nameEng.toString().toLowerCase() ==
              "new products") {
            newproductcollectionid = AllDataList[i].customId.toString();
            break;
          }
        }
        print("newproductcollectionid ${newproductcollectionid}");

        AllDataList.removeWhere(
            (item) => item.nameEng.toString().toLowerCase() == "new products");
        getnewproducts(newproductcollectionid);
        List listData2 = response.data['brand'];
        // print("listData brand ${listData2[2].toString()}");

        var parsingList2 = listData2.map((m) => Brand.fromJson(m)).toList();

        AllBrands.addAll(parsingList2);
        print("listData brand 3${AllBrands[2].toJson()}");

        List listData3 = response.data['slider'];
        print("listData slider ${listData3.first.toString()}");

        var parsingList3 = listData3.map((m) => Slider.fromJson(m)).toList();

        AllBanner.addAll(parsingList3);
        update();
        EasyLoading.dismiss();

        return true;
      } else {
        EasyLoading.dismiss();
        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
      // handle error
      return false;
    } finally {
      EasyLoading.dismiss();
      // isLoading.value = false; // set loading to false after operation
    }
  }

  Future<bool> getbrandsproducts(String id) async {
    print("call getbrands");
    try {
      EasyLoading.show();
      var response = await apiRepository.getbrandsproducts(id);
      if (response.data['products'].toString() != "[]") {
        List listData = response.data['products'];
        print("listData ${listData.length}");
        var parsingList = listData.map((m) => Products.fromJson(m)).toList();
        brandproduct.clear();
        brandproduct.addAll(parsingList); // add new items to your list
        print("brandproduct ${brandproduct.length}");
        update();
        EasyLoading.dismiss();

        return true;
      } else {
        EasyLoading.dismiss();

        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
      // handle error
      return false;
    } finally {
      EasyLoading.dismiss();
      // isLoading.value = false; // set loading to false after operation
    }
  }

  Future<bool> getnewproducts(String id) async {
    print("call new product");
    try {
      EasyLoading.show();
      var response = await apiRepository.getbrandsproducts(id);
      if (response.data['products'].toString() != "[]") {
        List listData = response.data['products'];
        print("listData ${listData.length}");
        var parsingList = listData.map((m) => Products.fromJson(m)).toList();
        newproduct.clear();
        newproduct.addAll(parsingList); // add new items to your list
        print("newproduct ${newproduct.length}");
        update();
        EasyLoading.dismiss();

        return true;
      } else {
        EasyLoading.dismiss();

        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
      // handle error
      return false;
    } finally {
      EasyLoading.dismiss();
      // isLoading.value = false; // set loading to false after operation
    }
  }

  Future<bool> masterdata() async {
    print("call getbrands");
    try {
      EasyLoading.show();
      var response = await apiRepository.getmasterdata();
      print(response.data);
      if (response.data['data'].toString() != "[]") {
        List listData = response.data['data'];
        print("listData ${listData.length}");
        var parsingList = listData.map((m) => Privacy.fromJson(m)).toList();
        privacy.clear();
        privacy.addAll(parsingList); // add new items to your list
        print("privacy ${privacy.length}");
        update();
        EasyLoading.dismiss();

        return true;
      } else {
        EasyLoading.dismiss();

        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
      // handle error
      return false;
    } finally {
      EasyLoading.dismiss();
      // isLoading.value = false; // set loading to false after operation
    }
  }

  Future<void> saveProductDetailsList(List<ProductDetail> productList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Serialize each ProductDetail object to a Map<String, dynamic> and convert to List<Map<String, dynamic>>.
    List<Map<String, dynamic>> productMapList =
        productList.map((product) => product.toJson()).toList();

    // Save the serialized list to shared preferences.
    await prefs.setStringList('productDetailsList',
        productMapList.map((map) => map.toString()).toList());
  }

  Future<List<ProductDetail>> getProductDetailsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the serialized list from shared preferences.
    List<String> serializedList =
        prefs.getStringList('productDetailsList') ?? [];

    // Deserialize each Map<String, dynamic> to a ProductDetail object.
    List<ProductDetail> productList = serializedList.map((serialized) {
      Map<String, dynamic> productMap = Map<String, dynamic>.from(
          Map<String, dynamic>.fromIterable(serialized.split(','),
              key: (k) => 'serialized', value: (v) => v));
      return ProductDetail.fromJson(productMap);
    }).toList();

    return productList;
  }
}
