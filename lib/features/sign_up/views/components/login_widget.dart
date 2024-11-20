import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/sign_up/controllers/sign_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:e_commerce/shared/widgets/custom_textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String currentPage = 'Log In';
    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.525.sh,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Form(
          key: SignController.to.loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentPage,
                style: SfTextStyles.fontBold(
                  color: MainColor.blackLight,
                  fontSize: 25.sp,
                ),
              ),
              42.verticalSpace,
              CustomTextField(
                label: 'Phone Number',
                isObscure: false,
                isRequired: true,
                requiredText: 'Phone number cant be empty',
                keyboardType: TextInputType.phone,
                controller: SignController.to.loginPhoneController,
              ),
              24.verticalSpace,
              Obx(
                () => CustomTextField(
                  label: 'Password',
                  isObscure: SignController.to.isObscureLogin.value,
                  isRequired: true,
                  requiredText: 'Password cant be empty',
                  keyboardType: TextInputType.text,
                  controller: SignController.to.loginPasswordController,
                  suffixIcon: GestureDetector(
                    onTap: SignController.to.showObscureLogin,
                    child: Icon(
                      (SignController.to.isObscureLogin.value)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 14.r,
                      color: MainColor.blackLight,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButtonWidget(
                title: currentPage,
                onTap: () => SignController.to.validateLogin(context),
              ),
              16.verticalSpace,
              RichText(
                text: TextSpan(
                  text: "Don't have an account?, ",
                  style: SfTextStyles.fontMedium(
                    color: MainColor.blackLight,
                    fontSize: 14.sp,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = SignController.to.changeState,
                      style: SfTextStyles.fontMedium(
                        color: MainColor.secondaryDark,
                        fontSize: 14.sp,
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
