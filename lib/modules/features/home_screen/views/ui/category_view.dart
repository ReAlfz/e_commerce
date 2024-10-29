import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/features/home_screen/controllers/category_controller.dart';
import 'package:e_commerce/shared/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.white,
      appBar: CustomAppBar(
        title: 'Categories',
        onTap: CategoryController.to.onBack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
            childAspectRatio: 0.9,
          ),
          itemCount: Dataset.catalog.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => CategoryController.to.toFilterCategory(index),
              child: Column(
                children: [
                  Container(
                    height: 145.h,
                    width: 145.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.r,
                    ),
                    padding: EdgeInsets.all(32.r),
                    decoration: const BoxDecoration(
                      color: MainColor.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Dataset.catalog[index].image,
                      fit: BoxFit.scaleDown,
                    ),
                  ),

                  Text(
                    Dataset.catalog[index].title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: MainColor.blackLight,
                      fontFamily: 'sf medium'
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
