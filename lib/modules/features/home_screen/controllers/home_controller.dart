import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxList<ProductModel> listHome = <ProductModel>[].obs;

  @override
  void onInit() {
    listHome(Dataset.flashSaleHome);
    super.onInit();
  }

  void toFlashSale() => Get.toNamed(MainRoute.flashSaleDetail);
  void toDetail(int index) {
    final data = listHome[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }
}