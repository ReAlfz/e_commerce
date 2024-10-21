import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/flashsale_controller.dart';
import 'package:e_commerce/modules/features/home_screen/views/components/flash_sale_appbar_widget.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashSaleView extends StatelessWidget {
  const FlashSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FlashSaleAppBar(),
      backgroundColor: MainColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: CustomGridViewWidget(
            list: FlashSaleController.to.listFlash,
            onTap: FlashSaleController.to.toDetail,
          ),
        ),
      ),
    );
  }
}
