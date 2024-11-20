import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/voucher_screen/controllers/voucher_controller.dart';
import 'package:e_commerce/features/voucher_screen/views/components/voucher_appbar_widget.dart';
import 'package:e_commerce/features/voucher_screen/views/components/voucher_checkbox_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MainColor.grey,
      appBar: VoucherAppbarWidget(
        onChanged: (value) => VoucherController.to.filtered(value),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
        margin: EdgeInsets.only(top: 8.h),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: VoucherController.to.filterList.length,
            itemBuilder: (context, index) {
              final data = VoucherController.to.filterList[index];
              return GestureDetector(
                onTap: () => VoucherController.to.toVoucherDetail(index),
                child: Container(
                  height: 120.h,
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                    color: MainColor.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 0.2,
                        color: Colors.black12,
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
                              data.title,
                              style: SfTextStyles.fontMedium(
                                color: MainColor.blackLight,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              data.termCondition,
                              style: SfTextStyles.fontRegular(
                                color: MainColor.blackLight,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.05.sw),
                        child: Obx(
                          () => VoucherCheckboxWidget(
                            isChecked:
                                VoucherController.to.selectedVoucher.value ==
                                    index,
                            onTap: (value) {
                              (value != true)
                                  ? VoucherController.to.selectedVoucher.value =
                                      index
                                  : VoucherController.to.selectedVoucher.value =
                                      null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: MainColor.white,
        padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 8.h),
        child: CustomButtonWidget(
          title: 'OK',
          onTap: VoucherController.to.backWithResult,
        ),
      ),
    );
  }
}
