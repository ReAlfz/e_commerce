import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileOptionWidget extends StatelessWidget {
  final String title;
  final bool? isObscure;
  final String? message;
  final double padding;
  final VoidCallback? onTap;

  const TileOptionWidget({
    super.key,
    required this.title,
    this.message,
    this.onTap,
    this.isObscure,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Row(
          children: [
            Text(
              title,
              style: SfTextStyles.fontMedium(
                color: MainColor.blackLight,
                fontSize: 14.sp,
              ),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 125.w),
                child: (message != null)
                    ? Text(
                        (isObscure != null && isObscure!)
                            ? message!.replaceAll(RegExp(r"."), '*')
                            : message!,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: SfTextStyles.fontMedium(
                          color: MainColor.blackLight,
                          fontSize: 14.sp,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            if (onTap != null)
              Icon(
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
