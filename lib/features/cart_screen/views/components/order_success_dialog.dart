import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/cart_screen/views/components/order_background.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSuccessDialog extends StatelessWidget {
  const OrderSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.35.sh,
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 0.085.sh,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const OrderBackground(),
                Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: const BoxDecoration(
                    color: MainColor.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 35.r,
                    color: MainColor.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'order has been created',
            textAlign: TextAlign.center,
            style: SfTextStyles.fontMedium(
              color: MainColor.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'thank you for ordering\non this application',
            textAlign: TextAlign.center,
            style: SfTextStyles.fontRegular(
              color: MainColor.darkGrey,
              fontSize: 16.sp,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButtonWidget(
              title: 'Continue',
              onTap: CartController.to.offAllRoute,
            ),
          ),
        ],
      ),
    );
  }
}
