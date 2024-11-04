import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/cart_screen/views/components/cart_checkbox_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllSelectWidget extends StatelessWidget {
  const AllSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => CartCheckBoxWidget(
                onTap: (value) => CartController.to.checkAllItem(),
                isChecked: CartController.to.selectAll.value,
              ),
            ),
            10.horizontalSpace,
            Text(
              'Select All',
              style: SfTextStyles.fontMedium(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: (CartController.to.checkItems.contains(true))
                ? GestureDetector(
                    onTap: CartController.to.removeItemsSelected,
                    child: Icon(
                      Icons.delete,
                      color: MainColor.danger,
                      size: 22.5.r,
                    ),
                  )
                : SizedBox(
                    height: 22.5.r,
                  ),
          );
        }),
      ],
    );
  }
}
