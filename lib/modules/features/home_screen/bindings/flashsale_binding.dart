import 'package:e_commerce/modules/features/home_screen/controllers/flashsale_controller.dart';
import 'package:get/get.dart';

class FlashSaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FlashSaleController());
  }
}