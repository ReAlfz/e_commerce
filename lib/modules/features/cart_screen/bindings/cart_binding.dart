import 'package:e_commerce/modules/features/cart_screen/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(CartController());
  }
}