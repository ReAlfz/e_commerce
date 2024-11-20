import 'package:e_commerce/features/detail_voucher_screen/controllers/detail_voucher_controller.dart';
import 'package:get/get.dart';

class DetailVoucherBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(DetailVoucherController());
  }
}