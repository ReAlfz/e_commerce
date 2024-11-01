import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
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
            right: 8.w,
            left: 8.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flash Sale',
                style: SfTextStyles.fontBold(
                  color: MainColor.black,
                  fontSize: 20.sp,
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
          aspectRatio: 0.6,
          list: HomeController.to.listHome,
          onTap: HomeController.to.toDetail,
        ),
      ],
    );
  }
}
