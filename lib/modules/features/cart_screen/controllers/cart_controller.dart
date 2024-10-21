import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxList<ProductModel> cartList = <ProductModel>[].obs;
  @override
  void onInit() {
    cartList(Dataset.flashSaleHome);
    super.onInit();
  }
}