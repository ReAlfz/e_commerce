import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/features/cart_screen/models/price_truple.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/shared/widgets/custom_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxList<CartModel> cartList = <CartModel>[].obs;
  RxBool buttonEnabler = false.obs;
  RxList<bool> checkItems = <bool>[].obs;
  RxBool selectAll = false.obs;

  @override
  void onInit() {
    cartList(GlobalController.to.cartListGlobal);
    buttonEnabler((GlobalController.to.user.value != null) ? true : false);
    super.onInit();
  }

  CartController() {
    cartList.listen((_) {
      checkItems(List<bool>.filled(cartList.length, false));
    });
  }

  void checkAllItem(){
    selectAll.value = !selectAll.value;
    checkItems(List<bool>.filled(cartList.length, selectAll.value));
  }

  void checkItemList(int index) {
    checkItems[index] = !checkItems[index];
    selectAll.value = checkItems.every((item) => item);
  }

  PriceTruple get getTotalPrice {
    List<CartModel> filterList = [];
    for (int i = 0; i < cartList.length; i ++) {
      if (checkItems[i]) filterList.add(cartList[i]);
    }

    int total = filterList.fold(0, (sum, item) => sum + item.price * item.quantity);
    return PriceTruple(totalPrice: total, itemCount: filterList.length);
  }

  void removeItemsSelected() {
    List<CartModel> filterCartList = [];
    for (int i = 0; i < cartList.length; i++) {
      if (!checkItems[i]) filterCartList.add(cartList[i]);
    }

    cartList(filterCartList);
    checkItems(List<bool>.filled(cartList.length, false));
    GlobalController.to.cartListGlobal(filterCartList);
    selectAll(false);
  }

  void onIncrement(int index) {
    cartList[index].quantity++;
    cartList.refresh();
  }

  void onDecrement(int index) {
    if (cartList[index].quantity == 1) {
      cartList.removeAt(index);
    } else {
      cartList[index].quantity--;
    }
    cartList.refresh();
  }

  void toDetail(int index) {
    final data =  cartList[index].product;
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }


  final RxBool obscure = RxBool(true);
  final pinController = TextEditingController();
  final RxnString errorText = RxnString();
  int tries = 0;

  Future<void> processPin(String? pin) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (pin == GlobalController.to.user.value!.pin) {
      pinController.clear();
      Get.back(result: true);
    } else {
      tries += 1;

      if (tries >= 3) {
        Get.back(result: false);
      } else {
        pinController.clear();
        errorText.value = 'Pin wrong!, ${(3 - tries).toString()} chances left';
      }
    }
  }
  
  void checkOut() async {
    if (getTotalPrice == 0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please select the product for checkout',
          icon: Icon(Icons.warning_amber_outlined, size: 20, color: MainColor.white),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final data = await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: CustomPinWidget(
        title: 'Insert your pin to continue',
        pinController: pinController,
        isObscure: obscure.value,
        onSubmit: processPin,
      ),
    );
  }

  void convertToOrderModel() {
    PriceTruple price = getTotalPrice;
    OrderModel(
      id_user: 0,
      id_order: 0,
      date: "",
      methodPayment: '',
      price: price.totalPrice,
      quantity: price.itemCount,
    );
  }
}