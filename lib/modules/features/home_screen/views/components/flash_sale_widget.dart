import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:e_commerce/shared/widgets/see_all_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flash Sale',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: MainColor.black,
                  fontFamily: 'sf bold',
                ),
              ),
              SeeAllButtonWidget(
                onTap: HomeController.to.toFlashSale,
              ),
            ],
          ),
        ),
        10.verticalSpace,
        CustomGridViewWidget(
          list: HomeController.to.listHome,
          onTap: HomeController.to.toDetail,
        ),
      ],
    );
  }
}