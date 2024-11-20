import 'package:e_commerce/features/voucher_screen/models/voucher_model.dart';
import 'package:get/get.dart';

class DetailVoucherController extends GetxController {
  static DetailVoucherController get to => Get.find();

  Rxn<VoucherModel> voucherData = Rxn<VoucherModel>();

  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    voucherData(data as VoucherModel);
  }
}