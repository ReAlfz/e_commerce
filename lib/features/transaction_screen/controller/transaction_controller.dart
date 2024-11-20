import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  RxList<OrderModel> transactionList = <OrderModel>[].obs;

  @override
  void onInit() {
    transactionList(GlobalController.to.transactionList);
    super.onInit();
  }

  void buyAgain({required int index}) {
    GlobalController.to.cartListGlobal(transactionList[index].listProduct);
    Get.toNamed(MainRoute.cart);
  }

  void toDetailOrder({required int index, required OrderModel data}) async {
    final newData = await Get.toNamed(MainRoute.detailOrder, arguments: data);
    if (newData != null) {
      int newIndex = transactionList.indexWhere((item) => item.id_order == newData['id']);
      if (newIndex != -1) {
        transactionList[newIndex].status = newData['status'];
        HiveService.saveListTransaction(transactionList);
        transactionList.refresh();
      }
    }
  }

  /// Filter List ///

  RxList<OrderModel> get onGoingList {
    return transactionList.where((item) => item.status <= 1).toList().obs;
  }

  RxList<OrderModel> get historyList {
    return transactionList
        .where((item) => item.status == 2 || item.status == 3)
        .toList()
        .obs;
  }

  /// Function for get data card ///

  String getImage({required int index, required List<OrderModel> list}) {
    return list[index].listProduct.first.images;
  }

  String getTotalProduct({required int index, required List<OrderModel> list}) {
    return '${list[index].quantity} product';
  }

  String getTitle({required int index, required List<OrderModel> list}) {
    List<CartModel> titleList = list[index].listProduct;
    String title = titleList.map((item) => item.title).join(', ');
    return title;
  }
}
