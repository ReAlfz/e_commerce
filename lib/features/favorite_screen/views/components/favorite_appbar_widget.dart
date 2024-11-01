import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String>? onChange;
  const FavoriteAppbarWidget({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favorite',
                    style: SfTextStyles.fontBold(
                      color: MainColor.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: FavoriteController.to.toCart,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: MainColor.secondaryDark,
                      size: 25.r,
                    ),
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 40.h,
              child: TextField(
                onChanged: onChange,
                style: SfTextStyles.fontRegular(fontSize: 14.sp),
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
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.15.sh);
}
