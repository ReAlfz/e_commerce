import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/modules/features/cart_screen/views/components/quantity_widget.dart';
import 'package:e_commerce/shared/widgets/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ListCartWidget extends StatelessWidget {
  const ListCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: CartController.to.cartList.length,
      itemBuilder: (context, index) {
        final data = CartController.to.cartList[index];
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          height: 90.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomCheckBoxWidget(),
              5.horizontalSpace,
              Container(
                width: 90.w,
                height: 70.h,
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: MainColor.grey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  data.images.first,
                  fit: BoxFit.scaleDown,
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Text(
                        data.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'sf reguler'
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(data.price),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'sf semi-bold',
                              ),
                            ),

                            const QuantityWidget(quantity: 1),
                          ],
                        ),
                        Divider(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
