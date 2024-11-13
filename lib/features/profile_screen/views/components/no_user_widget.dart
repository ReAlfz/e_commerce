import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/features/profile_screen/controllers/profile_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoUserWidget extends StatelessWidget {
  const NoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.bgUser,
          width: 120.r,
          height: 120.r,
        ),
        8.verticalSpace,
        Text(
          'Please login first before\nbuy some product',
          textAlign: TextAlign.center,
          style: SfTextStyles.fontMedium(
            color: MainColor.blackLight,
            fontSize: 16.sp,
          ),
        ),
        8.verticalSpace,
        SizedBox(
          width: 0.45.sw,
          child: CustomButtonWidget(
            title: 'Login',
            onTap: ProfileController.to.pushToLogin,
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
