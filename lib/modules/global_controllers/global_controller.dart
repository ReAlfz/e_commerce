import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController{
  static GlobalController get to => Get.find();

  List<ProductModel> get sessionList {
    List<ProductModel> favoriteList = HiveService.getList() ?? [];
    Set<int> favoriteId = favoriteList.map((item) => item.productId).toSet();
    List<ProductModel> currentList = Dataset.list;
    for (var item in currentList) {
      if (favoriteId.contains(item.productId)) {
        item.favorite = true;
      }
    }

    return currentList;
  }

  void saveList(List<ProductModel> favoriteList) {
    HiveService.saveList(favoriteList);
  }

  void saveFavoriteList(ProductModel data) {
    if (FavoriteController.to.favoriteList.contains(data)) {
      FavoriteController.to.favoriteList.remove(data);
    } else {
      FavoriteController.to.favoriteList.add(data);
    }
  }
}