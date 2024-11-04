import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_favorite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomGridViewWidget extends StatelessWidget {
  final double aspectRatio;
  final List<ProductModel> list;
  final Function(int) onTap;

  const CustomGridViewWidget(
      {super.key,
      required this.list,
      required this.onTap,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 16,
          childAspectRatio: aspectRatio,
        ),
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final data = list[index];
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: MainColor.grey,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Image.asset(
                          data.images.first,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () => GlobalController.to.saveFavoriteList(data),
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MainColor.white,
                            ),
                            child: CustomFavoriteIconWidget(
                              status: data.favorite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: SfTextStyles.fontMedium(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(data.price),
                        style: SfTextStyles.fontRegular(fontSize: 13.sp),
                      ),
                      5.verticalSpace,
                      Text(
                        'Stock: ${data.stock}',
                        style: SfTextStyles.fontRegular(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
