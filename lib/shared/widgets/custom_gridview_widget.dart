import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomGridViewWidget extends StatelessWidget {
  final List<ProductModel> list;
  final Function(int) onTap;

  const CustomGridViewWidget({super.key, required this.list, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
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
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MainColor.white,
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: MainColor.darkGrey,
                            size: 18.r,
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
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'sf medium',
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(data.price),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'sf medium',
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Stock: ${data.stock}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'sf reguler',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
