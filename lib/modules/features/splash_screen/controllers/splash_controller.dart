import 'dart:async';

import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() async {
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(MainRoute.home);
    });
    super.onInit();
  }
}