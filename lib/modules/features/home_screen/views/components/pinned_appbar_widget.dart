import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinnedAppbarWidget extends StatelessWidget {
  const PinnedAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      elevation: 1,
      toolbarHeight: 50.h,
      surfaceTintColor: MainColor.white,
      backgroundColor: MainColor.white,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 8.r, bottom: 8.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: const BoxDecoration(
                  color: MainColor.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.ac_unit,
                  size: 20,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivery address',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: 'sf reguler',
                  ),
                ),
                Text(
                  '92 High Street, London',
                  style: TextStyle(
                    color: MainColor.black,
                    fontSize: 14.sp,
                    fontFamily: 'sf reguler',
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(21.5, -8.5),
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: const BoxDecoration(
                          color: MainColor.secondary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: MainColor.white,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
