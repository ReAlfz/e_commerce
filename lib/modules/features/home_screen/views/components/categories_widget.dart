import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/shared/widgets/see_all_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 24.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: MainColor.black,
                  fontFamily: 'sf bold',
                ),
              ),
              SeeAllButtonWidget(
                onTap: () {
                  print('test');
                },
              ),
            ],
          ),
        ),
        15.verticalSpace,
        SizedBox(
          height: 90.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            scrollDirection: Axis.horizontal,
            itemCount: Dataset.catalog.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final data = Dataset.catalog[index];
              return Column(
                children: [
                  Container(
                    height: 70.r,
                    width: 70.r,
                    padding: EdgeInsets.all(10.r),
                    decoration: const BoxDecoration(
                      color: MainColor.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      data.image,
                      fit: BoxFit.scaleDown,
                    ),
                  ),

                  5.verticalSpace,

                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'sf reguler',
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => 16.horizontalSpace,
          ),
        ),
      ],
    );
  }
}