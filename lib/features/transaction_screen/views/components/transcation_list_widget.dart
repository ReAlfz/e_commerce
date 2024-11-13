import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionListWidget extends StatelessWidget {
  final List<OrderModel> currentList;

  const TransactionListWidget({super.key, required this.currentList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentList.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 8.h),
      itemBuilder: (context, index) {
        final data = currentList[index];
        return Obx(
          () => GestureDetector(
            onTap: () => TransactionController.to.toDetailOrder(
              index: index,
              data: data,
            ),
            child: Container(
              height: 0.175.sh,
              width: 1.sw,
              margin: EdgeInsets.all(8.r),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: MainColor.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 0.2,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 135,
                    width: 135,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: MainColor.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      TransactionController.to.getImage(
                        index: index,
                        list: currentList,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ConditionalSwitch.single(
                                context: context,
                                valueBuilder: (context) => data.status,
                                fallbackBuilder: (context) => const SizedBox(),
                                caseBuilders: {
                                  0: (context) => Text(
                                        'Product being packaged',
                                        style: SfTextStyles.fontRegular(
                                          color: MainColor.darkGrey,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                  1: (context) => Text(
                                        'Product on delivery',
                                        style: SfTextStyles.fontRegular(
                                          color: Colors.amber,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                  2: (context) => Text(
                                        'Delivery completed',
                                        style: SfTextStyles.fontRegular(
                                          color: Colors.green,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                  3: (context) => Text(
                                        'Order Canceled',
                                        style: SfTextStyles.fontRegular(
                                          color: Colors.redAccent,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                },
                              ),
                              Text(
                                data.date,
                                style: SfTextStyles.fontRegular(
                                  color: MainColor.darkGrey,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          TransactionController.to.getTitle(
                            list: currentList,
                            index: index,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: SfTextStyles.fontMedium(
                            color: MainColor.blackLight,
                            fontSize: 15.sp,
                          ),
                        ),
                        4.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(data.price),
                              style: SfTextStyles.fontMedium(
                                color: MainColor.blackLight,
                                fontSize: 14.sp,
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              '(${TransactionController.to.getTotalProduct(
                                index: index,
                                list: currentList,
                              )})',
                              style: SfTextStyles.fontRegular(
                                color: MainColor.darkGrey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        SizedBox(
                          width: 70.w,
                          height: 27.5.h,
                          child: OutlinedButton(
                            onPressed: () => TransactionController.to.buyAgain(
                              index: index,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: BorderSide(
                                color: MainColor.secondary,
                                width: 1.5.r,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              'Buy again',
                              style: SfTextStyles.fontMedium(
                                color: MainColor.blackLight,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
