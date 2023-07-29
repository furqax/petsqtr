import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:juber_car_booking/screens/ShHomeScreen.dart';

import '../binding/home_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => ShHomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
