import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/modules/features/favorite_screen/views/components/favorite_appbar_widget.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavoriteAppbarWidget(),
      backgroundColor: MainColor.grey,
      body: Container(
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
          list: FavoriteController.to.filteredList,
          onTap: FavoriteController.to.toDetail,
        ),
      ),
    );
  }
}