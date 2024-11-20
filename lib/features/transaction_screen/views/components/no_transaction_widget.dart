import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoTransactionWidget extends StatelessWidget {
  const NoTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.bgTransaction,
          height: 120.r,
          width: 120.r,
        ),
        4.verticalSpace,
        Text(
          'No Transaction here,\nplease buy some product first',
          textAlign: TextAlign.center,
          style: SfTextStyles.fontMedium(
            color: MainColor.blackLight,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
