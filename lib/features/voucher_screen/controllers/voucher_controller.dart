import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/features/voucher_screen/models/voucher_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherController extends GetxController {
  static VoucherController get to => Get.find();

  List<VoucherModel> voucherList = [];
  RxString filtered = ''.obs;
  RxnInt selectedVoucher = RxnInt();

  TextEditingController textEditingController = TextEditingController();
  List<VoucherModel> get filterList {
    return (filtered.value.isNotEmpty)
        ? voucherList
            .where(
              (item) => item.title
                  .toLowerCase()
                  .contains(filtered.value.toLowerCase()),
            )
            .toList()
        : voucherList;
  }

  @override
  void onInit() {
    voucherList = GlobalController.to.voucherList;
    super.onInit();
  }

  void backWithResult() {
    if (selectedVoucher.value != null) {
      VoucherModel voucherData = filterList[selectedVoucher.value!];
      Get.back(result: voucherData);
    } else {
      Get.back();
    }
  }

  void toVoucherDetail(int index) {
    final data = filterList[index];
    Get.toNamed(MainRoute.voucherDetail, arguments: data);
  }
}
