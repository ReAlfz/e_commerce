import 'package:e_commerce/modules/features/favorite_screen/bindings/favorite_binding.dart';
import 'package:e_commerce/modules/features/home_screen/bindings/home_binding.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/modules/features/profile_screen/bindings/profile_binding.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    HomeBinding().dependencies();
    FavoriteBinding().dependencies();
    ProfileBinding().dependencies();
  }
}