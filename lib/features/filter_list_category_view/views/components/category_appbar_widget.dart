import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final ValueChanged<String>? onChange;

  const CategoryAppbarWidget({super.key, required this.title, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 16.r, 16.w, 0),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: FilterListCategoryController.to.onBack,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 30.r,
                    color: MainColor.darkGrey,
                  ),
                ),
                Text(
                  title,
                  style: SfTextStyles.fontBold(
                    color: MainColor.black,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(width: 30.r),
              ],
            ),
            16.verticalSpace,
            SizedBox(
              height: 40.h,
              child: TextField(
                onChanged: onChange,
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
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.155.sh);
}
