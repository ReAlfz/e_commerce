import 'package:e_commerce/modules/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());
  }
}