import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBackground extends StatelessWidget {
  const OrderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 70,
          child: Container(
            width: 20.r,
            height: 20.r,
            decoration: const BoxDecoration(
              color: MainColor.secondaryLight,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 20.r,
            height: 20.r,
            decoration: const BoxDecoration(
              color: MainColor.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          top: 55,
          left: 95,
          child: Container(
            width: 12.r,
            height: 12.r,
            decoration: const BoxDecoration(
              color: MainColor.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          top: 45,
          left: 40,
          child: Container(
            width: 14.r,
            height: 14.r,
            decoration: const BoxDecoration(
              color: MainColor.secondaryDark,
              shape: BoxShape.circle,
            ),
          ),
        ),

        //

        Positioned(
          top: 0,
          right: 45,
          child: Container(
            width: 30.r,
            height: 30.r,
            decoration: const BoxDecoration(
              color: MainColor.secondaryLight,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          top: 45,
          right: 35,
          child: Container(
            width: 15.r,
            height: 15.r,
            decoration: const BoxDecoration(
              color: MainColor.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          bottom: 10,
          right: 80,
          child: Container(
            width: 15.r,
            height: 15.r,
            decoration: const BoxDecoration(
              color: MainColor.secondaryDark,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          bottom: 45,
          right: 10,
          child: Container(
            width: 15.r,
            height: 15.r,
            decoration: const BoxDecoration(
              color: MainColor.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
