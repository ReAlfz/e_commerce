import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerDetail extends StatelessWidget {
  const ProductShimmerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.45.sh,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 18.h,
            ),
            decoration: BoxDecoration(
              color: MainColor.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: MainColor.darkGrey,
              highlightColor: MainColor.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18.h,
                    width: 0.5.sw,
                    decoration: BoxDecoration(
                      color: MainColor.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 22.5.h,
                    width: 0.75.sw,
                    decoration: BoxDecoration(
                      color: MainColor.grey,
                      borderRadius: BorderRadius.circular(6.5.r),
                    ),
                  ),
                  16.verticalSpace,
                  Container(
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: MainColor.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp ',
                            decimalDigits: 0,
                          ).format(200000),
                          style: SfTextStyles.fontSemiBold(
                            color: MainColor.black,
                            fontSize: 16.sp,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          size: 20.r,
                          color: MainColor.darkGrey,
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  Container(
                    height: 0.14.sh,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: MainColor.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  const Spacer(),
                  16.verticalSpace,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButtonWidget(
                      title: 'Add to Cart',
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
