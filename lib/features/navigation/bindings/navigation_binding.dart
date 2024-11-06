import 'package:e_commerce/features/favorite_screen/bindings/favorite_binding.dart';
import 'package:e_commerce/features/home_screen/bindings/home_binding.dart';
import 'package:e_commerce/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/features/profile_screen/bindings/profile_binding.dart';
import 'package:e_commerce/features/transaction_screen/bindings/transaction_binding.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    HomeBinding().dependencies();
    FavoriteBinding().dependencies();
    ProfileBinding().dependencies();
    TransactionBinding().dependencies();
  }
}