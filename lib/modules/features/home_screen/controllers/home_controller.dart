import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxList<ProductModel> listHome = <ProductModel>[].obs;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    listHome(Dataset.flashSaleHome);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void toCategory() => Get.toNamed(MainRoute.category);
  void toFlashSale() => Get.toNamed(MainRoute.flashSaleDetail);
  void toSearch() => Get.toNamed(MainRoute.search);
  void toCart() => Get.toNamed(MainRoute.cart);

  void toDetail(int index) {
    final data = listHome[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void toFilterCategory(int index) {
    final data = Dataset.catalog[index].title;
    Get.toNamed(MainRoute.categoryList, arguments: data);
  }
}