import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckedStep extends StatelessWidget {
  const CheckedStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: MainColor.secondary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: -1,
            color: Colors.black54,
          )
        ],
      ),

      child: Icon(
        Icons.check,
        color: MainColor.white,
        size: 30.r,
      ),
    );
  }
}