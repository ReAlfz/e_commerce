import 'dart:async';

import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDataController extends GetxController {
  static SearchDataController get to => Get.find();

  RxString filtered = ''.obs;
  RxList<ProductModel> listSearch = <ProductModel>[].obs;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  RxList<ProductModel> get filteredList => (filtered.value.isNotEmpty)
      ? listSearch
          .where((element) =>
              element.title
                  .toLowerCase()
                  .contains(filtered.value.toLowerCase()) ||
              element.category
                  .toLowerCase()
                  .contains(filtered.value.toLowerCase()))
          .toList().obs
      : <ProductModel>[].obs;

  RxBool get searchState {
    int index = listSearch.indexWhere(
          (item) =>
      item.title.toLowerCase().contains(filtered.value.toLowerCase()) ||
          item.category.toLowerCase().contains(filtered.value.toLowerCase()),
    );

    return (index != -1) ? true.obs : false.obs;
  }

  @override
  void onInit() {
    listSearch(GlobalController.to.productList);
    super.onInit();
    Timer(
      const Duration(milliseconds: 300),
      () => focusNode.requestFocus(),
    );
  }

  void onBack() => Get.back();

  void toDetail(int index) {
    final data = filteredList[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
