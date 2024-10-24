import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/modules/features/detail_product_screen/views/components/border_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BorderContainerItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                size: 18.r,
                color: MainColor.secondary,
              ),
              2.5.horizontalSpace,
              Text(
                DetailProductController.to.productData.value!.rating.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: MainColor.black,
                  fontFamily: 'sf medium',
                ),
              ),
              10.horizontalSpace,
              Text(
                '${DetailProductController.to.productData.value!.totalReview} reviews',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: MainColor.darkGrey,
                  fontFamily: 'sf medium',
                ),
              ),
            ],
          ),
        ),
        8.horizontalSpace,
        BorderContainerItem(
          child: Row(
            children: [
              Icon(
                Icons.thumb_up_alt,
                size: 18.r,
                color: MainColor.primary,
              ),
              5.horizontalSpace,
              Text(
                '${DetailProductController.to.productData.value!.goodReview.toInt()}%',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: MainColor.black,
                  fontFamily: 'sf medium',
                ),
              ),
            ],
          ),
        ),
        8.horizontalSpace,
        BorderContainerItem(
          child: Row(
            children: [
              Icon(
                Icons.contact_support,
                size: 18.r,
                color: MainColor.darkGrey,
              ),
              2.5.horizontalSpace,
              Text(
                DetailProductController.to.productData.value!.numberChat.toString(),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: MainColor.black,
                    fontFamily: 'sf medium'
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}