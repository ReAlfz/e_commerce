import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/border_container_item.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewWidget extends StatelessWidget {
  final ProductModel data;
  const ReviewWidget({super.key, required this.data});

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
                data.rating.toString(),
                style: SfTextStyles.fontMedium(
                  color: MainColor.black,
                  fontSize: 12.sp,
                ),
              ),
              10.horizontalSpace,
              Text(
                '${data.totalReview} reviews',
                style: SfTextStyles.fontMedium(
                  color: MainColor.darkGrey,
                  fontSize: 12.sp,
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
                '${data.goodReview.toInt()}%',
                style: SfTextStyles.fontMedium(
                  color: MainColor.black,
                  fontSize: 12.sp,
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
                Icons.inventory_2,
                size: 18.r,
                color: MainColor.darkGrey,
              ),
              2.5.horizontalSpace,
              Text(
                '${data.stock} stock',
                style: SfTextStyles.fontRegular(
                  color: MainColor.blackLight,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}