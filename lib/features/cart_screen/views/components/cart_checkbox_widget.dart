import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool>onTap;
  const CartCheckBoxWidget({super.key, required this.onTap, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(isChecked);
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isChecked ? MainColor.secondary : Colors.transparent,
          border: Border.all(
            color: isChecked ? MainColor.secondary : MainColor.darkGrey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        width: 18.r,
        height: 18.r,
        child: Center(
          child: isChecked
              ? const Icon(
            Icons.check_rounded,
            size: 18.0,
            color: MainColor.white,
          ) : null,
        ),
      ),
    );
  }
}