import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const FavoriteAppbarWidget({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: MainColor.black,
                    fontFamily: 'sf bold',
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            16.verticalSpace,

            SizedBox(
              height: 40.h,
              child: TextField(
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
  Size get preferredSize => Size.fromHeight(0.175.sh);
}