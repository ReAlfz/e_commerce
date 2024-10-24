import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:e_commerce/modules/features/filter_list_category_view/views/components/category_appbar_widget.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterListCategoryView extends StatelessWidget {
  const FilterListCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: CategoryAppbarWidget(
        title: FilterListCategoryController.to.title,
        onChange: (value) => FilterListCategoryController.to.filtered(value),
      ),
      body: Obx(
        () => Container(
          height: 1.sh,
          width: 1.sw,
          margin: EdgeInsets.only(top: 8.r),
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
          decoration: BoxDecoration(
            color: MainColor.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.r),
            ),
          ),
          child: CustomGridViewWidget(
            list: FilterListCategoryController.to.filteredList,
            onTap: FilterListCategoryController.to.toDetail,
          ),
        ),
      ),
    );
  }
}