import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_order_screen/controllers/detail_order_controller.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/checked_step.dart';
import 'package:e_commerce/features/detail_order_screen/views/components/unchecked_step.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderTrackerWidget extends StatelessWidget {
  const OrderTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConditionalSwitch.single(
            context: context,
            valueBuilder: (context) =>
                DetailOrderController.to.orderData.value!.status,
            fallbackBuilder: (context) => const SizedBox(),
            caseBuilders: {
              0: (context) => Text(
                    'Product being packaged',
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 12.sp,
                    ),
                  ),
              1: (context) => Text(
                    'Product on delivery',
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 12.sp,
                    ),
                  ),
              2: (context) => Text(
                    'Delivery completed',
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 12.sp,
                    ),
                  ),
              3: (context) => Text(
                    'Order Canceled',
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 12.sp,
                    ),
                  ),
            },
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      DetailOrderController.to.orderData.value?.status == 0,
                  widgetBuilder: (context) => const CheckedStep(),
                  fallbackBuilder: (context) => const UncheckedStep(),
                ),
              ),
              Expanded(
                child: Container(
                  height: 4.r,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      DetailOrderController.to.orderData.value?.status == 1,
                  widgetBuilder: (context) => const CheckedStep(),
                  fallbackBuilder: (context) => const UncheckedStep(),
                ),
              ),
              Expanded(
                child: Container(
                  height: 4.r,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      DetailOrderController.to.orderData.value?.status == 2,
                  widgetBuilder: (context) => const CheckedStep(),
                  fallbackBuilder: (context) => const UncheckedStep(),
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Product being\npackaged',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: SfTextStyles.fontRegular(
                    color: MainColor.blackLight,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  'Product\non delivery',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: SfTextStyles.fontRegular(
                    color: MainColor.blackLight,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  'Delivery\ncompleted',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: SfTextStyles.fontRegular(
                    color: MainColor.blackLight,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
