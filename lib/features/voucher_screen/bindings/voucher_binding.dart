import 'package:e_commerce/features/voucher_screen/controllers/voucher_controller.dart';
import 'package:get/get.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(VoucherController());
  }
}