import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidgetDetail extends StatelessWidget implements PreferredSizeWidget{
  const AppbarWidgetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8.r),
        color: MainColor.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: DetailProductController.to.onBack,
              child: Container(
                padding: EdgeInsets.all(12.r),
                decoration: const BoxDecoration(
                  color: MainColor.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  size: 18.r,
                  color: MainColor.black,
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: const BoxDecoration(
                      color: MainColor.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      size: 18.r,
                      color: MainColor.black,
                      Icons.favorite_outline,
                    ),
                  ),
                ),

                5.horizontalSpace,

                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: const BoxDecoration(
                    color: MainColor.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    size: 18.r,
                    color: MainColor.black,
                    Icons.cloud_upload_outlined,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight +  8.h);
}