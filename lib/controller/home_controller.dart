import 'package:get/get.dart';
import 'package:juber_car_booking/models/alldatacategory.dart';
import 'package:nb_utils/nb_utils.dart';

import '../api-handler/api-repo.dart';
import '../models/collection_product.dart';
import '../screens/Product/productlist.dart';

class HomeController extends GetxController {
  ApiRepository apiRepository;
  HomeController(this.apiRepository);
  var AllDataList = List<Department>.empty(growable: true).obs;
  var AllBrands = List<Brand>.empty(growable: true).obs;
  var AllBanner = List<Slider>.empty(growable: true).obs;
  var brandproduct = List<Products>.empty(growable: true).obs;

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
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> getalldata() async {
    try {
      var response = await apiRepository.getalldata();
      if (response.data['department'].toString() != "[]") {
        List listData = response.data['department'];
        print("listData ${listData.length}");
        // print("parsing list : ${response.data['data']['data']}");
        var parsingList = listData.map((m) => Department.fromJson(m)).toList();

        AllDataList.addAll(parsingList); // add new items to your list
        print("AllDataList ${AllDataList.length}");

        List listData2 = response.data['brand'];
        print("listData brand ${listData2[2].toString()}");

        var parsingList2 = listData2.map((m) => Brand.fromJson(m)).toList();

        AllBrands.addAll(parsingList2);
        print("listData brand 3${AllBrands[2].toJson()}");

        List listData3 = response.data['slider'];
        print("listData slider ${listData3.first.toString()}");

        var parsingList3 = listData3.map((m) => Slider.fromJson(m)).toList();

        AllBanner.addAll(parsingList3);
        update();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("error $e");
      // handle error
      return false;
    } finally {
      // isLoading.value = false; // set loading to false after operation
    }
  }

  Future<bool> getbrandsproducts(String id) async {
    try {
      var response = await apiRepository.getbrandsproducts(id);
      if (response.data['products'].toString() != "[]") {
        List listData = response.data['products'];
        print("listData ${listData.length}");
        var parsingList = listData.map((m) => Products.fromJson(m)).toList();
        brandproduct.clear();
        brandproduct.addAll(parsingList); // add new items to your list
        print("brandproduct ${brandproduct.length}");
        update();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("error $e");
      // handle error
      return false;
    } finally {
      // isLoading.value = false; // set loading to false after operation
    }
  }
}
