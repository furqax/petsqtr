import 'package:get/get.dart';
import 'package:juber_car_booking/models/alldatacategory.dart';
import 'package:nb_utils/nb_utils.dart';

import '../api-handler/api-repo.dart';
import '../models/collection_product.dart';
import '../models/productdetail.dart';
import '../screens/Product/productlist.dart';

class ProductListController extends GetxController {
  ApiRepository apiRepository;
  ProductListController(this.apiRepository);
  // var productdetail = List<ProductDetail>.empty(growable: true).obs;
  late ProductDetail? productdetail;

  List<bool> isExpandedList = [];
  List<List<bool>> isSubcategoryExpandedList = [];
  @override
  void onInit() {}

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> getproductsdetail(String id) async {
    try {
      var response = await apiRepository.singleproductdetail(id);
      if (response.data['product'].toString() != "[]") {
        print(response.data['product']);
        print(response.data['product']["variants"]);

        productdetail = ProductDetail.fromJson(response.data['product']);

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
