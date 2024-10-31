import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = 20.r;
    final fontSize = 16.sp;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            'Select Image Source',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'sf medium',
              color: MainColor.blackLight,
            ),
          ),

          10.verticalSpace,
          TextButton(
            onPressed: () => Get.back(result: ImageSource.gallery),
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  size: iconSize,
                  color: MainColor.blackLight,
                ),

                16.horizontalSpace,
                Text(
                  'Galery',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'sf medium',
                    color: MainColor.blackLight,
                  ),
                ),
              ],
            ),
          ),

          TextButton(
            onPressed: () => Get.back(result: ImageSource.camera),
            child: Row(
              children: [
                Icon(
                  Icons.camera,
                  size: iconSize,
                  color: MainColor.blackLight,
                ),

                16.horizontalSpace,
                Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'sf medium',
                    color: MainColor.blackLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}