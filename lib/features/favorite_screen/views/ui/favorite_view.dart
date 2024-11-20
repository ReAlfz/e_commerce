import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/features/favorite_screen/views/components/favorite_appbar_widget.dart';
import 'package:e_commerce/features/favorite_screen/views/components/no_favorite_widget.dart';
import 'package:e_commerce/shared/widgets/custom_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FavoriteAppbarWidget(
          onChange: (value) => FavoriteController.to.filtered(value),
        ),
        backgroundColor: MainColor.grey,
        body: Container(
          height: 1.sh,
          width: 1.sw,
          margin: EdgeInsets.only(top: 8.r),
          padding: EdgeInsets.fromLTRB(8.w, 24.h, 8.w, 16.h),
          decoration: BoxDecoration(
            color: MainColor.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.r),
            ),
          ),
          child: Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                FavoriteController.to.filteredList.isNotEmpty,
            fallbackBuilder: (context) => const NoFavoriteWidget(),
            widgetBuilder: (context) => Obx(
              () => CustomGridViewWidget(
                aspectRatio: 0.6,
                list: FavoriteController.to.filteredList,
                onTap: FavoriteController.to.toDetail,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
