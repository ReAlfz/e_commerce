import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollapseAppbar extends StatelessWidget {
  const CollapseAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      elevation: 1,
      expandedHeight: 0.2.sh,
      backgroundColor: Colors.transparent,
      collapsedHeight: 110.h,
      flexibleSpace: Container(
        padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 16.h),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        child: FlexibleSpaceBar(
          centerTitle: true,
          expandedTitleScale: 1,
          background: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              ),
              15.verticalSpace,
              Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                  vertical: 8.r,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: const LinearGradient(
                    colors: [
                      MainColor.secondaryLight,
                      MainColor.secondary,
                    ],
                    begin: FractionalOffset(0, 0.8),
                    end: FractionalOffset(1, 0),
                    stops: [0.2, 1.0],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery is',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MainColor.black,
                        fontFamily: 'sf medium',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 3.5.h,
                        horizontal: 7.5.w,
                      ),
                      decoration: BoxDecoration(
                        color: MainColor.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '50%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: MainColor.black,
                          fontFamily: 'sf semi-bold',
                        ),
                      ),
                    ),
                    Text(
                      'Cheaper',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MainColor.black,
                        fontFamily: 'sf medium',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
