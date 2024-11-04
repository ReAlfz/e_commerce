import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:get/get.dart';

class FlashSaleController extends GetxController {
  static FlashSaleController get to => Get.find();

  RxList<ProductModel> listFlash = <ProductModel>[].obs;

  @override
  void onInit() async {
    listFlash(GlobalController.to.productList);
    super.onInit();
  }

  void onBack() => Get.back();
  void toDetail(int index) {
    final data = listFlash[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void favoriteTap() => listFlash.refresh();
}