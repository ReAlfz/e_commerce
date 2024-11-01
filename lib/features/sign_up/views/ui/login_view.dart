import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/sign_up/controllers/login_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_background.dart';
import 'package:e_commerce/shared/widgets/custom_button.dart';
import 'package:e_commerce/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const String currentPage = 'Log In';
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: MainColor.grey,
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackGround(),
              GestureDetector(
                onTap: LoginController.to.onBack,
                child: Container(
                  margin: EdgeInsets.only(left: 16.w, top: 8.h),
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: MainColor.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 30.r,
                    color: MainColor.blackLight,
                  ),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 0.9.sw,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    decoration: BoxDecoration(
                      color: MainColor.white,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Form(
                      key: LoginController.to.signUpKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'sign',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                currentPage,
                                style: SfTextStyles.fontBold(
                                  color: MainColor.blackLight,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ),
                          42.verticalSpace,
                          CustomTextField(
                            label: 'Phone Number',
                            isObscure: false,
                            isRequired: true,
                            requiredText: 'Phone number cant be empty',
                            keyboardType: TextInputType.phone,
                            controller: LoginController.to.phoneController,
                          ),
                          24.verticalSpace,
                          Obx(
                                () => CustomTextField(
                              label: 'Password',
                              isObscure: LoginController.to.isObscure.value,
                              isRequired: true,
                              requiredText: 'Password cant be empty',
                              keyboardType: TextInputType.text,
                              controller: LoginController.to.passwordController,
                              suffixIcon: GestureDetector(
                                onTap: LoginController.to.showObscure,
                                child: Icon(
                                  (LoginController.to.isObscure.value)
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 14.r,
                                  color: MainColor.blackLight,
                                ),
                              ),
                            ),
                          ),
                          42.verticalSpace,
                          CustomButton(
                            title: currentPage,
                            onTap: () => LoginController.to.validateForm(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}