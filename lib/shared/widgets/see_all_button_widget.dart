import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const SeeAllButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'See all',
            style: TextStyle(
              color: MainColor.darkGrey,
              fontFamily: 'sf medium',
              fontSize: 14.sp,
            ),
          ),

          5.horizontalSpace,

          Container(
            padding: EdgeInsets.all(2.r),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: MainColor.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              size: 16.r,
              weight: 200,
              color: MainColor.black,
            ),
          ),
        ],
      ),
    );
  }
}