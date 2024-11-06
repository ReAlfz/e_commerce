import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnGoingWidget extends StatelessWidget {
  const OnGoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      child: Obx(
        () => ListView.builder(
          itemCount: TransactionController.to.transactionList.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Container(
              height: 0.2.sh,
              width: 1.sw,
              margin: EdgeInsets.all(8.r),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      TransactionController.to.transactionList[index].date,
                      style: SfTextStyles.fontRegular(
                        color: MainColor.darkGrey,
                        fontSize: 12.5.sp,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        height: 135,
                        width: 135,
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: MainColor.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Image.asset(
                          TransactionController.to.getImage(index),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TransactionController.to.getTitle(index),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: SfTextStyles.fontMedium(
                                  color: MainColor.blackLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
