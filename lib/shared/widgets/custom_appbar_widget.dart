import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;
  const CustomAppBar({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      title: Text(
        title,
        style: SfTextStyles.fontBold(
          color: MainColor.black,
          fontSize: 20.sp,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.r,
          color: MainColor.darkGrey,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}