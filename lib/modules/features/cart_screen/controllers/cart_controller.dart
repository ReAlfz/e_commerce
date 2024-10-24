import 'package:e_commerce/modules/features/cart_screen/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<bool> checkItems = <bool>[].obs;
  RxBool selectAll = false.obs;

  CartController() {
    cartList.listen((_) {
      checkItems.value = List<bool>.filled(cartList.length, false);
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
}