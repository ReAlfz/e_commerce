import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:e_commerce/features/home_screen/controllers/flashsale_controller.dart';
import 'package:e_commerce/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/features/search_data_screen/controllers/search_data_controller.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/shared/global_repositories/global_repository.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  RxList<CartModel> cartListGlobal = <CartModel>[].obs;
  List<UserModel> userData = <UserModel>[].obs;
  Rxn<UserModel> user = Rxn<UserModel>();
  List<ProductModel> productList = <ProductModel>[];
  List<OrderModel> transactionList = <OrderModel>[];
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  List<ProductModel> get sessionList {
    List<ProductModel> favoriteList = HiveService.getListFavorite() as List<ProductModel>;
    Set<int> favoriteId = favoriteList.map((item) => item.productId).toSet();
    for (var item in productList) {
      if (favoriteId.contains(item.productId)) {
        item.favorite = true;
      }
    }

    return favoriteList;
  }

  void saveFavoriteList(ProductModel data) {
    if (user.value == null) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'You need login for add product to favorite',
          icon: Icon(Icons.warning_amber_outlined, size: 20, color: MainColor.white),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

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
    HiveService.saveListFavorite(FavoriteController.to.favoriteList);
  }

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

  @override
  void onInit() async {
    user(HiveService.getUser());
    userData = HiveService.getListUser() as List<UserModel>;
    productList = await GlobalRepository().getProducts();
    transactionList = HiveService.getListTransaction() as List<OrderModel>;
    productList.shuffle();
    super.onInit();
  }
}
