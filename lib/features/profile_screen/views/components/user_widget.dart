import 'dart:io';

import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/features/profile_screen/controllers/profile_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:e_commerce/shared/widgets/tile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
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
                    valueBuilder: (context) =>
                        ProfileController.to.photoState.value,
                    caseBuilders: {
                      'data-file': (context) => Image.file(
                            ProfileController.to.imageFile.value!,
                            width: 170.r,
                            height: 170.r,
                            fit: BoxFit.cover,
                          ),
                      'data-hive': (context) => Image.file(
                            File(ProfileController.to.user.value!.photo),
                            width: 170.r,
                            height: 170.r,
                            fit: BoxFit.cover,
                          ),
                    },
                    fallbackBuilder:  (context) => Image.asset(
                      ImageConstants.bgImage,
                      width: 170.r,
                      height: 170.r,
                      fit: BoxFit.cover,
                    ),
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
                        style: SfTextStyles.fontMedium(
                          color: MainColor.blackLight,
                          fontSize: 13.sp,
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
                padding: 13.h,
                message: ProfileController.to.user.value?.name,
                onTap: () => ProfileController.to.changeData(code: 'Name'),
              ),
              TileOptionWidget(
                title: 'Email',
                padding: 13.h,
                message: ProfileController.to.user.value?.email,
                onTap: () => ProfileController.to.changeData(code: 'Email'),
              ),
              TileOptionWidget(
                title: 'Phone Number',
                padding: 13.h,
                message: ProfileController.to.user.value?.phone,
                onTap: () =>
                    ProfileController.to.changeData(code: 'Phone Number'),
              ),
              TileOptionWidget(
                title: 'Address',
                padding: 13.h,
                message: ProfileController.to.user.value?.address,
                onTap: () => ProfileController.to.changeData(code: 'Address'),
              ),
              TileOptionWidget(
                title: 'Country',
                padding: 13.h,
                message: ProfileController.to.user.value?.country,
                onTap: () => ProfileController.to.changeData(code: 'Country'),
              ),
              TileOptionWidget(
                title: 'Pin',
                padding: 13.h,
                message: ProfileController.to.user.value?.pin.toString(),
                isObscure: true,
                onTap: () => ProfileController.to.changeData(code: 'Pin'),
              ),
              TileOptionWidget(
                title: 'Password',
                padding: 13.h,
                message: ProfileController.to.user.value?.password,
                onTap: () => ProfileController.to.changeData(code: 'Password'),
                isObscure: true,
              ),

              32.verticalSpace,
              SizedBox(
                width: 120.w,
                child: CustomButtonWidget(
                  title: 'Sign out',
                  onTap: ProfileController.to.signOut,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
