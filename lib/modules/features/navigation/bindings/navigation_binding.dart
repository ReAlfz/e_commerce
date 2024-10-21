import 'package:e_commerce/modules/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(HomeController());
    Get.put(CartController());
  }
}