import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/cart_screen/controllers/cart_controller.dart';
import 'package:e_commerce/features/cart_screen/views/components/quantity_widget.dart';
import 'package:e_commerce/features/cart_screen/views/components/cart_checkbox_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListCartWidget extends StatelessWidget {
  const ListCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: CartController.to.cartList.length,
        itemBuilder: (context, index) {
          final data = CartController.to.cartList[index];
          return Slidable(
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                icon: Icons.delete,
                backgroundColor: MainColor.grey,
                foregroundColor: MainColor.danger,
                onPressed: (context) {
                  CartController.to.cartList.removeAt(index);
                  CartController.to.cartList.refresh();
                },
              ),
            ],),
            child: GestureDetector(
              onTap: () => CartController.to.toDetail(index),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 8.h,
                ),
                height: 90.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => CartCheckBoxWidget(
                        isChecked: CartController.to.checkItems[index],
                        onTap: (value) => CartController.to.checkItemList(index),
                      ),
                    ),
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
                        data.images,
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
                              style: SfTextStyles.fontRegular(
                                fontSize: 13.sp,
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
                                    style: SfTextStyles.fontSemiBold(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  QuantityWidget(
                                    quantity: CartController
                                        .to.cartList[index].quantity,
                                    onIncrement: () =>
                                        CartController.to.onIncrement(index),
                                    onDecrement: () =>
                                        CartController.to.onDecrement(index),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: MainColor.darkGrey,
                                thickness: 0.8,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
