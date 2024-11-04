import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/widgets/custom_cart_icon_widget.dart';
import 'package:e_commerce/shared/widgets/custom_favorite_icon_widget.dart';
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
              onTap: Get.back,
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
                      () => CustomFavoriteIconWidget(
                        status: DetailProductController
                            .to.productData.value!.favorite,
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
                    child: AddToCartIcon(
                      key: GlobalController.to.cartKey,
                      badgeOptions: const BadgeOptions(active: false),
                      icon: const CustomCartIconWidget(),
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 8.h);
}
