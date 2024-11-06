import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      centerTitle: true,
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
            'Cart',
            style: SfTextStyles.fontBold(
              fontSize: 20.sp,
              color: MainColor.blackLight,
            ),
          ),
          SizedBox(width: 30.w),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
