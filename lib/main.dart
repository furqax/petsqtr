import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:juber_car_booking/api-handler/api-handler-api.dart';
import 'package:juber_car_booking/route/app_pages.dart';
import 'package:juber_car_booking/theme/color_codes.dart';
import 'package:juber_car_booking/theme/theme_service.dart';
import 'package:juber_car_booking/utils/ShColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:juber_car_booking/screens/ShSplashScreen.dart';
import 'package:juber_car_booking/store/AppStore.dart';
import 'package:juber_car_booking/utils/AppTheme.dart';
import 'package:juber_car_booking/utils/ShConstant.dart';
import 'package:juber_car_booking/utils/ShDataGenerater.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'api-handler/api-handler.dart';
import 'api-handler/api-repo.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiBaseHelperApi(), permanent: true);

  Get.put(ApiRepository(Get.find(), Get.find()));

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  configLoading();
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GetMaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'PetsQtr${!isMobile ? ' ${platformName()}' : ''}',
        initialRoute: AppPages.INITIAL,
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        getPages: AppPages.routes,
        themeMode: ThemeService().theme,
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = sh_colorPrimary
    // ..backgroundColor = sh_colorPrimary
    ..indicatorColor = sh_colorPrimary
    // ..textColor = sh_colorPrimary
    // ..maskColor = sh_colorPrimary
    ..userInteractions = true
    ..dismissOnTap = false;
}
