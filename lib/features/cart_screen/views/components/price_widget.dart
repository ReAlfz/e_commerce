import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/profile_screen/views/components/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => TileOptionWidget(
            title: 'Total Price : ',
            message: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(CartController.to.getTotalPrice.totalPrice),
          ),
        ),
      ],
    );
  }
}
