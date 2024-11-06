import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_cart_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0.085.sh,
      pinned: true,
      elevation: 1,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.r),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: HomeController.to.toSearch,
              child: Hero(
                tag: 'search-all-product',
                child: Material(
                  color: Colors.transparent,
                  child: TextField(
                    enabled: false,
                    focusNode: HomeController.to.focusNode,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey[400],
                        size: 22.r,
                      ),
                      filled: true,
                      fillColor: MainColor.grey,
                      hintText: 'Search the entire shop',
                      hintStyle: SfTextStyles.fontRegular(
                        color: Colors.grey[400]!,
                        fontSize: 14.sp,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.5.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          if (!HomeController.to.focusNode.hasFocus) ...[
            10.horizontalSpace,
            SizedBox(
              height: 25.r,
              width: 25.r,
              child: GestureDetector(
                onTap: HomeController.to.toCart,
                child: const CustomCartIconWidget(),
              ),
            ),
          ],

          5.horizontalSpace,
        ],
      ),
    );
  }
}
