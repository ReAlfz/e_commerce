import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/cart_screen/views/components/all_select_widget.dart';
import 'package:e_commerce/features/cart_screen/views/components/cart_appbar_widget.dart';
import 'package:e_commerce/features/cart_screen/views/components/list_cart_widget.dart';
import 'package:e_commerce/features/cart_screen/views/components/price_widget.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: const CartAppBarWidget(),
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
            const PriceWidget(),
            8.verticalSpace,
            CustomButtonWidget(
              title: (CartController.to.buttonEnabler.value)
                  ? 'Checkout'
                  : 'You need login to Continue',
              enabler: CartController.to.buttonEnabler.value,
              onTap: CartController.to.checkOut,
            ),
          ],
        ),
      ),
    );
  }
}
