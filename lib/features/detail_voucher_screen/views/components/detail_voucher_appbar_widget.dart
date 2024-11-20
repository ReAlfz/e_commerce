import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailVoucherAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailVoucherAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.r),
        ),
      ),
      title: Row(
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
            'Detail Voucher',
            style: SfTextStyles.fontBold(
              color: MainColor.blackLight,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(width: 30.r),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
