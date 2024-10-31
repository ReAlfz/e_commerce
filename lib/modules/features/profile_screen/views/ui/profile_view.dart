import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/modules/features/profile_screen/controllers/profile_controller.dart';
import 'package:e_commerce/modules/features/profile_screen/views/components/profile_appbar_widget.dart';
import 'package:e_commerce/modules/features/profile_screen/views/components/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                    Obx(
                      () => ConditionalSwitch.single(
                        context: context,
                        valueBuilder: (context) => ProfileController.to.photoState.value,
                        caseBuilders: {
                          // 'data-session':,
                          'data-file': (context) => Image.file(
                            ProfileController.to.imageFile.value!,
                            width: 170.r,
                            height: 170.r,
                            fit: BoxFit.cover,
                          ),
                          'no-data': (context) => Container(
                            color: MainColor.grey,
                            child: Image.asset(
                              ImageConstants.bgImage,
                              width: 170.r,
                              height: 170.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                        }
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () => ProfileController.to.pickImage(),
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
            Obx(
              () => Column(
                children: [
                  TileOptionWidget(
                    title: 'Name',
                    message: ProfileController.to.user.value?.name ?? 'username',
                    onTap: () {},
                  ),
                  TileOptionWidget(
                    title: 'Email',
                    message: ProfileController.to.user.value?.email ?? 'email@xx.com',
                    onTap: () {},
                  ),
                  TileOptionWidget(
                    title: 'Phone Number',
                    message: ProfileController.to.user.value?.phone ?? '...',
                    onTap: () {},
                  ),
                  TileOptionWidget(
                    title: 'Address',
                    message: ProfileController.to.user.value?.address ?? '...',
                    onTap: () {},
                  ),
                  TileOptionWidget(
                    title: 'Contry',
                    message: ProfileController.to.user.value?.country ?? '...',
                    onTap: () {},
                  ),
                  TileOptionWidget(
                    title: 'Password',
                    message: ProfileController.to.user.value?.password ?? '...',
                    onTap: () {},
                    isObscure: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
