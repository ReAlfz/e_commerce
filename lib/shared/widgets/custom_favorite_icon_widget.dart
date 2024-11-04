import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomFavoriteIconWidget extends StatelessWidget {
  final bool status;
  const CustomFavoriteIconWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: (status)
          ? Icon(
        Icons.favorite,
        key: const ValueKey('filled'),
        color: MainColor.danger,
        size: 22.5.r,
      ) : Icon(
        Icons.favorite_outline,
        key: const ValueKey('outline'),
        color: MainColor.blackLight,
        size: 22.5.r,
      ),
    );
  }
}
