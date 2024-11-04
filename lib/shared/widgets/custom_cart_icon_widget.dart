import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCartIconWidget extends StatelessWidget {
  const CustomCartIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          color: MainColor.secondaryDark,
          size: 25.r,
        ),
        Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: (GlobalController.to.cartListGlobal.isNotEmpty)
                ? Transform.translate(
                    offset: const Offset(18.5, -7.5),
                    child: Container(
                      height: 16.r,
                      width: 16.r,
                      decoration: const BoxDecoration(
                        color: MainColor.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          GlobalController.to.cartListGlobal.length.toString(),
                          style: SfTextStyles.fontRegular(
                            color: MainColor.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: 16.r,
                    height: 16,
                  ),
          );
        })
      ],
    );
  }
}
