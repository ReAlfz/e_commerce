import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/cart_screen/views/components/cart_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllSelectWidget extends StatelessWidget {
  const AllSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'sf medium',
          ),
        ),
      ],
    );
  }
}
