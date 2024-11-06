import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  RxList<OrderModel> transactionList = <OrderModel>[].obs;

  @override
  void onInit() {
    transactionList(GlobalController.to.orderList);
    super.onInit();
  }

  String getImage(int index) => transactionList[index].listProduct.first.images;
  String getTitle(int index) {
    List<CartModel> titleList = transactionList[index].listProduct;
    String title = titleList.map((item) => item.title).join(', ');
    return title;
  }
}