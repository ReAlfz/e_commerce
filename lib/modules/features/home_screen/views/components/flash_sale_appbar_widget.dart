import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/flashsale_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashSaleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashSaleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      title: Text(
        'Flash Sale',
        style: TextStyle(
          fontSize: 20.sp,
          color: MainColor.black,
          fontFamily: 'sf bold',
        ),
      ),
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: FlashSaleController.to.onBack,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.r,
          color: MainColor.darkGrey,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}