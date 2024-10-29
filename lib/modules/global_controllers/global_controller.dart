import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/modules/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/modules/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/modules/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/flashsale_controller.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/modules/features/search_data_screen/controllers/search_data_controller.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  List<ProductModel> get sessionList {
    List<ProductModel> favoriteList = HiveService.getList() as List<ProductModel>;
    Set<int> favoriteId = favoriteList.map((item) => item.productId).toSet();
    List<ProductModel> currentList = Dataset.list;
    for (var item in currentList) {
      if (favoriteId.contains(item.productId)) {
        item.favorite = true;
      }
    }

    return favoriteList;
  }

  void saveList(List<ProductModel> favoriteList) {
    HiveService.saveList(favoriteList);
  }

  void saveFavoriteList(ProductModel data) {
    if (FavoriteController.to.favoriteList.contains(data)) {
      data.favorite = false;
      FavoriteController.to.favoriteList.remove(data);
    } else {
      data.favorite = true;
      FavoriteController.to.favoriteList.add(data);
    }

    FavoriteController.to.favoriteList.refresh();
    HomeController.to.listHome.refresh();

    if (Get.isRegistered<FlashSaleController>()) {
      FlashSaleController.to.listFlash.refresh();
    }
    if (Get.isRegistered<FilterListCategoryController>()) {
      FilterListCategoryController.to.filteredList.refresh();
    }
    if (Get.isRegistered<DetailProductController>()) {
      DetailProductController.to.productData.refresh();
    }

    if (Get.isRegistered<SearchDataController>()) {
      SearchDataController.to.listSearch.refresh();
    }
    HiveService.saveList(FavoriteController.to.favoriteList);
  }

  List<CartModel> cartListGlobal = [];
  void updateCartListGlobal(CartModel data) {
    int cartIndex = cartListGlobal.indexWhere((element) =>
    element.productId == data.productId &&
        element.variantColor == data.variantColor &&
        element.variantSwitch == data.variantSwitch);
    if (cartIndex != -1) {
      cartListGlobal[cartIndex].quantity++;
    } else {
      cartListGlobal.add(data);
    }
  }
}
