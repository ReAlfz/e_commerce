import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/cart_screen/views/components/all_select_widget.dart';
import 'package:e_commerce/modules/features/cart_screen/views/components/appbar_widget.dart';
import 'package:e_commerce/modules/features/cart_screen/views/components/list_cart_widget.dart';
import 'package:e_commerce/shared/widgets/custom_button.dart';
import 'package:e_commerce/shared/widgets/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const AppBarWidget(),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        margin: EdgeInsets.only(top: 8.r),
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        child: Column(
          children: [
            const AllSelectWidget(),
            const Expanded(
              child: ListCartWidget(),
            ),
            CustomButton(
              title: 'Checkout',
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
