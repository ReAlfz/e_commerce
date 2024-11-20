import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/voucher_screen/controllers/voucher_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoucherAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final ValueChanged<String>? onChanged;

  const VoucherAppbarWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: MainColor.blackLight,
                    size: 30.r,
                  ),
                ),
                Text(
                  'Select Voucher',
                  textAlign: TextAlign.center,
                  style: SfTextStyles.fontBold(
                    color: MainColor.blackLight,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(width: 20.r),
              ],
            ),
            8.verticalSpace,
            SizedBox(
              height: 40.h,
              child: TextField(
                onChanged: onChanged,
                style: SfTextStyles.fontRegular(fontSize: 14.sp),
                textAlign: TextAlign.start,
                controller: VoucherController.to.textEditingController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.grey[400],
                    size: 22.r,
                  ),
                  suffixIcon: Obx(
                    () => GestureDetector(
                      onTap: () {
                        VoucherController.to.filtered.value = '';
                        VoucherController.to.textEditingController.clear();
                      },
                      child: (VoucherController.to.filtered.value.isNotEmpty)
                          ? Icon(
                              Icons.cancel,
                              color: MainColor.darkGrey,
                              size: 14.r,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  filled: true,
                  fillColor: MainColor.grey,
                  hintText: 'Search voucher available',
                  hintStyle: SfTextStyles.fontRegular(
                    color: Colors.grey[400]!,
                    fontSize: 14.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.15.sh);
}
