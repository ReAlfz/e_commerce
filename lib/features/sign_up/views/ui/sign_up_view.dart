import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/sign_up/controllers/sign_up_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/features/sign_up/views/components/custom_background.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:e_commerce/shared/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    const String currentPage = 'Sign Up';
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: MainColor.grey,
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackGround(),
              GestureDetector(
                onTap: SignUpController.to.onBack,
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
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Form(
                      key: SignUpController.to.signInKey,
                      child: Column(
                        children: [
                          Hero(
                            tag: 'sign',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                currentPage,
                                textAlign: TextAlign.center,
                                style: SfTextStyles.fontBold(
                                  color: MainColor.blackLight,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ),
                          42.verticalSpace,
                          CustomTextField(
                            label: 'Name',
                            isObscure: false,
                            isRequired: true,
                            requiredText: 'Name cant be empty',
                            keyboardType: TextInputType.text,
                            controller: SignUpController.to.nameController,
                          ),
                          16.verticalSpace,
                          CustomTextField(
                            label: 'Email',
                            isObscure: false,
                            isRequired: true,
                            requiredText: 'Email cant be empty',
                            keyboardType: TextInputType.emailAddress,
                            controller: SignUpController.to.emailController,
                          ),
                          16.verticalSpace,
                          CustomTextField(
                            label: 'Phone Number',
                            isObscure: false,
                            isRequired: true,
                            requiredText: 'Phone Number cant be empty',
                            keyboardType: TextInputType.text,
                            controller: SignUpController.to.phoneController,
                          ),
                          16.verticalSpace,
                          CustomTextField(
                            label: 'Password',
                            isObscure: true,
                            isRequired: true,
                            requiredText: 'Password cant be empty',
                            keyboardType: TextInputType.text,
                            controller: SignUpController.to.passwordController,
                          ),
                          42.verticalSpace,
                          CustomButtonWidget(
                            title: currentPage,
                            enabler: true,
                            onTap: () => SignUpController.to.validateForm(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
