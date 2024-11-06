import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:e_commerce/features/transaction_screen/views/components/list_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnGoingWidget extends StatelessWidget {
  const OnGoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      child: Obx(
        () => ListOrder(currentList: TransactionController.to.onGoingList),
      ),
    );
  }
}
