import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/sign_up/controllers/sign_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:e_commerce/shared/widgets/custom_textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String currentPage = 'Sign Up';
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 0.9.sw,
          height: 0.725.sh,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
          decoration: BoxDecoration(
            color: MainColor.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Form(
            key: SignController.to.signUpKey,
            child: Column(
              children: [
                Text(
                  currentPage,
                  textAlign: TextAlign.center,
                  style: SfTextStyles.fontBold(
                    color: MainColor.blackLight,
                    fontSize: 25.sp,
                  ),
                ),
                42.verticalSpace,
                CustomTextField(
                  label: 'Name',
                  isObscure: false,
                  isRequired: true,
                  requiredText: 'Name cant be empty',
                  keyboardType: TextInputType.text,
                  controller: SignController.to.signNameController,
                ),
                16.verticalSpace,
                CustomTextField(
                  label: 'Email',
                  isObscure: false,
                  isRequired: true,
                  requiredText: 'Email cant be empty',
                  specificString: '@',
                  requiredSpecificString: 'Input must email format',
                  keyboardType: TextInputType.emailAddress,
                  controller: SignController.to.signEmailController,
                ),
                16.verticalSpace,
                CustomTextField(
                  label: 'Phone Number',
                  isObscure: false,
                  isRequired: true,
                  requiredText: 'Phone Number cant be empty',
                  keyboardType: TextInputType.phone,
                  controller: SignController.to.signPhoneController,
                ),
                16.verticalSpace,
                Obx(
                      () => CustomTextField(
                    label: 'Password',
                    isObscure: SignController.to.isObscureSignUp.value,
                    isRequired: true,
                    suffixIcon: GestureDetector(
                      onTap: SignController.to.showObscureSignUp,
                      child: Icon(
                        (SignController.to.isObscureSignUp.value)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 14.r,
                        color: MainColor.blackLight,
                      ),
                    ),
                    requiredText: 'Password cant be empty',
                    keyboardType: TextInputType.text,
                    controller: SignController.to.signPasswordController,
                  ),
                ),
                const Spacer(),
                CustomButtonWidget(
                  title: currentPage,
                  onTap: () => SignController.to.validateSignUp(context),
                ),
                16.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: "Do you have an account?, ",
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 14.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'login here',
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
      ),
    );
  }
}
