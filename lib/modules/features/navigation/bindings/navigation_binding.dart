import 'package:e_commerce/modules/features/cart_screen/bindings/cart_binding.dart';
import 'package:e_commerce/modules/features/favorite_screen/bindings/favorite_binding.dart';
import 'package:e_commerce/modules/features/home_screen/bindings/home_binding.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    HomeBinding().dependencies();
    CartBinding().dependencies();
    FavoriteBinding().dependencies();
  }
}