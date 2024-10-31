import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20.r,
          right: -50.r,
          child: Container(
            width: 80.r,
            height: 80.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondaryDark,
            ),
          ),
        ),

        Positioned(
          top: 140.r,
          left: 20.r,
          child: Container(
            width: 100.r,
            height: 100.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondaryLight,
            ),
          ),
        ),

        Positioned(
          top: 30.r,
          left: 130.r,
          child: Container(
            width: 60.r,
            height: 60.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondary,
            ),
          ),
        ),

        Positioned(
          top: 110.r,
          right: 60.r,
          child: Container(
            width: 50.r,
            height: 50.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondaryDark,
            ),
          ),
        ),

        Positioned(
          top: -10.r,
          left: -30.r,
          child: Container(
            width: 90.r,
            height: 90.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondaryLight,
            ),
          ),
        ),

        Positioned(
          top: 240.r,
          right: -60.r,
          child: Container(
            width: 90.r,
            height: 90.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MainColor.secondary,
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 0.5.sh,
            decoration: BoxDecoration(
              color: MainColor.secondary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}