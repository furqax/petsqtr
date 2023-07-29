import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../controller/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductListController>(ProductListController(Get.find()));
  }
}
