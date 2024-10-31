import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppbarWidgetDetail extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWidgetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 8.h, 14.w, 8.h),
        color: MainColor.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: DetailProductController.to.onBack,
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: const BoxDecoration(
                  color: MainColor.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  size: 28.r,
                  color: MainColor.black,
                  Icons.chevron_left_rounded,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => GlobalController.to.saveFavoriteList(
                    DetailProductController.to.productData.value!,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      color: MainColor.white,
                      shape: BoxShape.circle,
                    ),
                    child: Obx(
                          () => Icon(
                        (DetailProductController.to.productData.value!.favorite)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 22.5.r,
                        color:
                        (DetailProductController.to.productData.value!.favorite)
                            ? MainColor.danger
                            : MainColor.black,
                      ),
                    ),
                  ),
                ),

                8.horizontalSpace,

                GestureDetector(
                  onTap: DetailProductController.to.toCart,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      color: MainColor.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 22.5.r,
                      color: MainColor.secondaryDark,
                    ),
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 8.h);
}
