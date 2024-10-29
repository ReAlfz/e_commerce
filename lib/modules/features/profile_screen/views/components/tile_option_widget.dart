import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileOptionWidget extends StatelessWidget {
  final String title;
  final String? message;
  final VoidCallback? onTap;

  const TileOptionWidget(
      {super.key, required this.title, this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: MainColor.blackLight,
                fontFamily: 'sf medium',
              ),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 125.w),
                child: (message != null) ? Text(
                  message!,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'sf medium',
                    color: MainColor.blackLight,
                  ),
                ) : const SizedBox(),
              ),
            ),

            if (onTap != null) Icon(
              Icons.chevron_right,
              color: MainColor.blackLight,
              size: 18.r,
            ),
          ],
        ),
      ),
    );
  }
}
