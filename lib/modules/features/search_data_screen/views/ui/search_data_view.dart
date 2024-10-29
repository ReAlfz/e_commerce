import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/search_data_screen/controllers/search_data_controller.dart';
import 'package:e_commerce/modules/features/search_data_screen/views/components/search_appbar_widget.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchDataView extends StatelessWidget {
  const SearchDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: MainColor.grey,
        appBar: SearchAppbarWidget(
          onChange: (value) => SearchDataController.to.filtered(value),
        ),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          margin: EdgeInsets.only(top: 8.r),
          padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
          decoration: BoxDecoration(
            color: MainColor.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.r),
            ),
          ),
          child: Obx(
            () => CustomGridViewWidget(
              list: SearchDataController.to.filteredList,
              onTap: SearchDataController.to.toDetail,
              aspectRatio: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
