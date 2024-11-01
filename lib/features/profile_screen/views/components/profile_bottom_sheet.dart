import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileBottomSheet extends StatefulWidget {
  final String title;
  const ProfileBottomSheet({super.key, required this.title});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  widget.title,
                  style: SfTextStyles.fontMedium(
                    color: MainColor.blackLight,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (text) => controller.text = text,
                      style: SfTextStyles.fontRegular(
                        color: MainColor.blackLight,
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white60,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.2.r,
                            color: MainColor.blackLight,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.2.r,
                            color: MainColor.secondaryDark,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.2.r,
                            color: MainColor.secondaryDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  4.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.back(result: controller.text),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MainColor.primary,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 20.r,
                        color: MainColor.blackLight,
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
