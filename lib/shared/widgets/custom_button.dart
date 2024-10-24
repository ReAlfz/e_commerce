import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: MainColor.primary,
        foregroundColor: MainColor.black,
        fixedSize: Size(1.sw, 37.5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'sf medium',
        ),
      ),
    );
  }
}