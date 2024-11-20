import 'package:e_commerce/features/detail_order_screen/controllers/detail_order_controller.dart';
import 'package:e_commerce/shared/widgets/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileOptionWidget(
          title: 'Total Price',
          padding: 3.5.h,
          message: NumberFormat.currency(
            locale: 'id',
            symbol: 'Rp ',
            decimalDigits: 0,
          ).format(DetailOrderController.to.orderData.value!.price *
              DetailOrderController.to.orderData.value!.quantity),
        ),
        TileOptionWidget(
          title: 'Payment method',
          padding: 3.5.h,
          message: DetailOrderController.to.orderData.value!.methodPayment,
        ),
        12.verticalSpace,
      ],
    );
  }
}
