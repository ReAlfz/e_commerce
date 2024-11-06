import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(TransactionController());
  }
}