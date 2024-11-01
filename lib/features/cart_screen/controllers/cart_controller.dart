import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<bool> checkItems = <bool>[].obs;
  RxBool selectAll = false.obs;

  @override
  void onInit() {
    cartList(GlobalController.to.cartListGlobal);
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

  void removeItemsSelected() {
    List<CartModel> filterCartList = [];
    for (int i = 0; i < cartList.length; i++) {
      if (!checkItems[i]) filterCartList.add(cartList[i]);
    }

    cartList(filterCartList);
    checkItems(List<bool>.filled(cartList.length, false));
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
}