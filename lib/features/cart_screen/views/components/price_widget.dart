import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/widgets/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileOptionWidget(
          title: 'Address : ',
          padding: 2.5.h,
          message: GlobalController.to.user.value!.address,
        ),
        Obx(
          () => TileOptionWidget(
            title: 'Total Price : ',
            padding: 2.5.h,
            message: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(CartController.to.getTotalPrice.totalPrice),
          ),
        ),
        TileOptionWidget(
          title: 'Payment method : ',
          padding: 2.5.h,
          message: 'Cash on Delivery',
        ),
      ],
    );
  }
}
