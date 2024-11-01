import 'dart:async';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/bottom_sheet_detail.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  static DetailProductController get to => Get.find();

  Rxn<ProductModel> productData = Rxn<ProductModel>();
  RxInt currentPages = 0.obs;
  RxInt price = 0.obs;
  RxBool state = false.obs;
  RxInt colorIndex = 0.obs;
  RxInt switchIndex = 0.obs;

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  GlobalKey imageBottomSheetKey = GlobalKey();
  GlobalKey imageKey = GlobalKey();
  late Function(GlobalKey) runCartAnimation;

  void runAnimationCartNow(GlobalKey key) async {
    await runCartAnimation(key);
    await cartKey.currentState!.runCartAnimation();
  }

  void changeIndex({int? colorIdx, int? switchIdx}) {
    if (productData.value!.variantSwitch != null && switchIdx != null) {
      switchIndex(switchIdx);
    }
    colorIndex(colorIdx);
  }

  void createOrder() async {
    if (productData.value!.variantColor != null ||
        productData.value!.variantSwitch != null) {
      Get.bottomSheet(
        BottomSheetDetail(
          productModel: productData.value!,
          color: productData.value?.variantColor,
          switchOption: productData.value?.variantSwitch,
        ),
      );
    } else {
      convertToCart();
      runAnimationCartNow(imageKey);
    }
  }

  void convertToCart() {
    final data = CartModel(
      productId: productData.value!.productId,
      title: productData.value!.title,
      description: productData.value!.description,
      quantity: 1,
      product: productData.value!,
      price: price.value,
      images: (productData.value!.variantColor == null)
          ? productData.value!.images.first
          : productData.value!.images[colorIndex.value],
      variantColor: (productData.value!.variantColor != null)
          ? productData.value!.variantColor![colorIndex.value].name
          : null,
      variantSwitch: (productData.value!.variantSwitch != null)
          ? productData.value!.variantSwitch![switchIndex.value].name
          : null,
    );
    GlobalController.to.updateCartListGlobal(data);
  }

  @override
  void onInit() async {
    productData(Get.arguments);
    if (productData.value!.variantColor != null) {
      setPrice(colorIdx: 0, switchIdx: 0);
    } else {
      setPrice();
    }
    Timer(
      const Duration(milliseconds: 400),
      () => state(true),
    );
    super.onInit();
  }

  void setPrice({int? colorIdx, int? switchIdx}) {
    int totalPrice = productData.value!.price;

    if (productData.value!.variantColor != null && colorIdx != null) {
      totalPrice += productData.value!.variantColor![colorIdx].price;
    }

    if (productData.value!.variantSwitch != null && switchIdx != null) {
      totalPrice += productData.value!.variantSwitch![switchIdx].price;
    }

    price(totalPrice);
  }

  void toCart() => Get.toNamed(MainRoute.cart);
}
