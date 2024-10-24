import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final ValueChanged<String>? onChange;
  const CategoryAppbarWidget({super.key, required this.title, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          16.w, 16.r, 16.w, 0,
        ),
        decoration: BoxDecoration(
            color: MainColor.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25.r),
            )),
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
                    Icons.arrow_back_ios_new_rounded,
                    size: 20.r,
                    color: MainColor.darkGrey,
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: MainColor.black,
                      fontFamily: 'sf bold',
                    ),
                  ),
                ),

                const SizedBox(),
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
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'sp reguler',
                    color: Colors.grey[400],
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