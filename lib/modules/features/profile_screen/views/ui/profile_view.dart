import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/modules/features/profile_screen/views/components/profile_appbar_widget.dart';
import 'package:e_commerce/modules/features/profile_screen/views/components/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: const ProfileAppbarWidget(),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        margin: EdgeInsets.only(top: 8.r),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
          children: [
            Center(
              child: Container(
                width: 170.r,
                height: 170.r,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Stack(
                  children: [
                    Container(
                      color: MainColor.grey,
                      child: Image.asset(
                        ImageConstants.bgImage,
                        width: 170.r,
                        height: 170.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150.w,
                          color: MainColor.primary,
                          padding: EdgeInsets.only(top: 5.r, bottom: 10.r),
                          child: Text(
                            'Change',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'sf medium',
                              color: MainColor.blackLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            42.verticalSpace,
            Column(
              children: [
                TileOptionWidget(
                  title: 'Name',
                ),

                TileOptionWidget(
                  title: 'Email',
                ),

                TileOptionWidget(
                  title: 'Phone Number',
                ),

                TileOptionWidget(
                  title: 'Address',
                ),

                TileOptionWidget(
                  title: 'Contry',
                ),

                TileOptionWidget(
                  title: 'Password',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
