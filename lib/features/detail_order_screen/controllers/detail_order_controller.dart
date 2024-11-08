import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/features/detail_order_screen/models/status_model.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:get/get.dart';

class DetailOrderController extends GetxController {
  static DetailOrderController get to => Get.find();

  List<CartModel> cartList = [];
  Rxn<OrderModel> orderData = Rxn<OrderModel>();

  final List<StatusModel> dropdownList = [
    StatusModel(title: 'Packaging', value: 0),
    StatusModel(title: 'Delivery', value: 1),
    StatusModel(title: 'Complete', value: 2),
    StatusModel(title: 'Canceled', value: 3),
  ];

  @override
  void onInit() {
    orderData(Get.arguments);
    cartList = orderData.value!.listProduct;
    super.onInit();
  }

  void changeStatus(int? value) {
    orderData.value!.status = value!;
    orderData.refresh();
  }

  void onBack() {
    final data = {
      'id': orderData.value!.id_order,
      'status': orderData.value!.status
    };
    Get.back(result: data);
  }

}