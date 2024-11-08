import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/detail_order_appbar_widget.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/detail_widget.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/list_detail_widget.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/order_tracker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: const DetailOrderAppbarWidget(),
      body: Container(
        height: 1.sh,
        margin: EdgeInsets.only(top: 8.h),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        child: const ListDetailWidget(),
      ),
      bottomNavigationBar: Container(
        color: MainColor.white,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DetailWidget(),
            const OrderTrackerWidget(),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
