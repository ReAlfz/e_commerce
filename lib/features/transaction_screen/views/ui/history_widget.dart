import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:e_commerce/features/transaction_screen/views/components/no_transaction_widget.dart';
import 'package:e_commerce/features/transaction_screen/views/components/transcation_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

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
      child: Conditional.single(
        context: context,
        conditionBuilder: (context) =>
            TransactionController.to.historyList.isNotEmpty,
        fallbackBuilder: (context) => const NoTransactionWidget(),
        widgetBuilder: (context) => Obx(
          () => TransactionListWidget(
            currentList: TransactionController.to.historyList,
          ),
        ),
      ),
    );
  }
}
