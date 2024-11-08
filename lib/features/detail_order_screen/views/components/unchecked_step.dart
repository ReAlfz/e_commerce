import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UncheckedStep extends StatelessWidget {
  const UncheckedStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Icon(
        Icons.circle,
        color: MainColor.darkGrey,
        size: 30.r,
      ),
    );
  }
}
