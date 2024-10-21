import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  static DetailProductController get to => Get.find();

  @override
  void onInit() {
    ProductModel data = Get.arguments;
    print(data.title);
    super.onInit();
  }
}