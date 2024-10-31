import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get to => Get.find();

  RxList<ProductModel> favoriteList = <ProductModel>[].obs;
  RxString filtered = ''.obs;

  List<ProductModel> get filteredList => (filtered.value.isNotEmpty)
      ? favoriteList
          .where((element) => element.title.toLowerCase().contains(filtered.value.toLowerCase()))
          .toList()
      : favoriteList;

  @override
  void onInit() {
    favoriteList(GlobalController.to.sessionList);
    super.onInit();
  }

  void toDetail(int index) {
    final data = filteredList[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void toCart() => Get.toNamed(MainRoute.cart);
}
