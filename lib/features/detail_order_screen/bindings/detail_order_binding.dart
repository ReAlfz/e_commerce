import 'package:e_commerce/features/detail_order_screen/controllers/detail_order_controller.dart';
import 'package:get/get.dart';

class DetailOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailOrderController());
  }
}