import 'dart:async';

import 'package:e_commerce/modules/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/modules/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/modules/features/detail_product_screen/views/components/bottom_sheet_detail.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  static DetailProductController get to => Get.find();

  Rxn<ProductModel> productData = Rxn<ProductModel>();
  RxInt currentPages = 0.obs;
  RxInt price = 0.obs;
  RxBool state = false.obs;
  RxInt colorIndex = 0.obs;
  RxInt switchIndex = 0.obs;

  void onBack() => Get.back();

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
    }
  }

  void convertToCart() {
    final data = CartModel(
      productId: productData.value!.productId,
      title: productData.value!.title,
      description: productData.value!.description,
      quantity: 1,
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

    int cartIndex = CartController.to.cartList.indexWhere((element) =>
        element.productId == data.productId &&
        element.variantColor == data.variantColor &&
        element.variantSwitch == data.variantSwitch);
    if (cartIndex != -1) {
      CartController.to.cartList[cartIndex].quantity++;
      CartController.to.cartList.refresh();
    } else {
      CartController.to.cartList.add(data);
      CartController.to.cartList.refresh();
    }
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
      const Duration(milliseconds: 100),
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
}
