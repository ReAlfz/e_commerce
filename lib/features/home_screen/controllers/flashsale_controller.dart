import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:get/get.dart';

class FlashSaleController extends GetxController {
  static FlashSaleController get to => Get.find();

  RxList<ProductModel> listFlash = <ProductModel>[].obs;

  @override
  void onInit() {
    listFlash(Dataset.flashSaleDetail);
    super.onInit();
  }

  void onBack() => Get.back();
  void toDetail(int index) {
    final data = listFlash[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void favoriteTap() => listFlash.refresh();
}