import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_voucher_screen/controllers/detail_voucher_controller.dart';
import 'package:e_commerce/features/detail_voucher_screen/views/components/detail_voucher_appbar_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailVoucherView extends StatelessWidget {
  const DetailVoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: const DetailVoucherAppbarWidget(),
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            margin: EdgeInsets.only(top: 0.15.sh),
            padding: EdgeInsets.fromLTRB(10.w, 0.085.sh, 10.w, 8.h),
            decoration: BoxDecoration(
              color: MainColor.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Period of Validity',
                  style: SfTextStyles.fontMedium(
                    fontSize: 15.sp,
                    color: MainColor.blackLight,
                  ),
                ),
                4.verticalSpace,
                Text(
                  DetailVoucherController.to.voucherData.value!.periode,
                  style: SfTextStyles.fontRegular(
                    fontSize: 13.sp,
                    color: MainColor.blackLight,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Promotion',
                  style: SfTextStyles.fontMedium(
                    fontSize: 15.sp,
                    color: MainColor.blackLight,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '${DetailVoucherController.to.voucherData.value!.title} with ${DetailVoucherController.to.voucherData.value!.termCondition}',
                  softWrap: true,
                  style: SfTextStyles.fontRegular(
                    fontSize: 13.sp,
                    color: MainColor.blackLight,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Description',
                  style: SfTextStyles.fontMedium(
                    fontSize: 15.sp,
                    color: MainColor.blackLight,
                  ),
                ),
                4.verticalSpace,
                Text(
                  DetailVoucherController.to.voucherData.value!.description,
                  softWrap: true,
                  style: SfTextStyles.fontRegular(
                    fontSize: 13.sp,
                    color: MainColor.blackLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120.h,
            margin: EdgeInsets.fromLTRB(10.w, 24.h, 10.w, 0.h),
            decoration: BoxDecoration(
              color: MainColor.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 0.2,
                  color: Colors.black26,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0.025.sw, right: 0.025.sw),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_bag,
                    color: MainColor.darkGrey,
                    size: 70.r,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DetailVoucherController.to.voucherData.value!.title,
                        style: SfTextStyles.fontMedium(
                          color: MainColor.blackLight,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        DetailVoucherController
                            .to.voucherData.value!.termCondition,
                        style: SfTextStyles.fontRegular(
                          color: MainColor.blackLight,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
