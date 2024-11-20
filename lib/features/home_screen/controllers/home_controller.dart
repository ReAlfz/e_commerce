import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/features/voucher_screen/models/voucher_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_repositories/global_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxList<ProductModel> listHome = <ProductModel>[].obs;
  RxList<VoucherModel> listVoucher = <VoucherModel>[].obs;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() async {
    listHome(GlobalController.to.productList.take(10).toList());
    listVoucher(await GlobalRepository().getVoucher());
    super.onInit();
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

  void toVoucherDetail(int index) {
    final data = listVoucher[index];
    Get.toNamed(MainRoute.voucherDetail, arguments: data);
  }

  void toDetail(int index) {
    final data = listHome[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void toFilterCategory(int index) {
    final data = Dataset.catalog[index].title;
    Get.toNamed(MainRoute.categoryList, arguments: data);
  }
}
