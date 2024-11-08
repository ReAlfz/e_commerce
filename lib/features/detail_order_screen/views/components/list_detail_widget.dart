import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_order_screen/controllers/detail_order_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ListDetailWidget extends StatelessWidget {
  const ListDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 8.h),
      physics: const BouncingScrollPhysics(),
      itemCount: DetailOrderController.to.cartList.length,
      itemBuilder: (context, index) {
        final data = DetailOrderController.to.cartList[index];
        return GestureDetector(
          child: Container(
            height: 90.h,
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: SfTextStyles.fontMedium(
                          fontSize: 14.sp,
                        ),
                      ),

                      6.verticalSpace,

                      Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(data.price * data.quantity),
                            style: SfTextStyles.fontSemiBold(
                              fontSize: 12.sp,
                            ),
                          ),
                          4.horizontalSpace,
                          Text(
                            '(${data.quantity} Product)',
                            style: SfTextStyles.fontRegular(
                              color: MainColor.darkGrey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}