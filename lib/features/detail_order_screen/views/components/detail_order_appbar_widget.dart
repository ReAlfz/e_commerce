import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_order_screen/controllers/detail_order_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailOrderAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const DetailOrderAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: 0.075.sh,
        automaticallyImplyLeading: false,
        backgroundColor: MainColor.white,
        surfaceTintColor: MainColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: DetailOrderController.to.onBack,
              child: Icon(
                Icons.chevron_left_rounded,
                color: MainColor.blackLight,
                size: 30.r,
              ),
            ),

            Text(
              'Detail Order',
              style: SfTextStyles.fontBold(
                color: MainColor.blackLight,
                fontSize: 20.sp,
              ),
            ),

            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isDense: true,
                customButton: Icon(
                  Icons.more_horiz,
                  color: MainColor.secondaryDark,
                  size: 25.r,
                ),
                onChanged: DetailOrderController.to.changeStatus,
                items: DetailOrderController.to.dropdownList.map((item) {
                  return DropdownMenuItem(
                    value: item.value,
                    child: Text(
                      item.title,
                      style: SfTextStyles.fontMedium(
                        color: MainColor.blackLight,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }).toList(),
                dropdownStyleData: DropdownStyleData(
                  width: 100.w,
                  elevation: 1,
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 8),
                  maxHeight: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.075.sh);

}