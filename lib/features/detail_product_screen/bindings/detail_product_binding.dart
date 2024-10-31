import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:get/get.dart';

class DetailProductBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(DetailProductController());
  }
}