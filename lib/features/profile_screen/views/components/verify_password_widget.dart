import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/profile_screen/views/components/custom_profile_textfield.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyPasswordWidget extends StatefulWidget {
  final String password;

  const VerifyPasswordWidget({super.key, required this.password});

  @override
  State<VerifyPasswordWidget> createState() => _VerifyPasswordWidgetState();
}

class _VerifyPasswordWidgetState extends State<VerifyPasswordWidget> {
  bool changeState = false;
  bool visibility = false;
  int currentIndex = 0;
  final firstTextController = TextEditingController();
  final secondTextController = TextEditingController();
  final thirdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 0.8.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      margin: EdgeInsets.only(bottom: 10.r),
      child: Material(
        color: Colors.transparent,
        child: IndexedStack(
          index: currentIndex,
          children: [
            AnimatedOpacity(
              opacity: (!changeState) ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child: Column(
                children: [
                  Text(
                    'Input your old password',
                    style: SfTextStyles.fontMedium(
                      color: MainColor.blackLight,
                      fontSize: 16.sp,
                    ),
                  ),
                  16.verticalSpace,
                  CustomProfileTextField(controller: firstTextController),
                  16.verticalSpace,
                  CustomButtonWidget(
                    title: 'Verify',
                    onTap: () {
                      if (firstTextController.text == widget.password) {
                        setState(() {
                          changeState = !changeState;
                          visibility = !visibility;
                          currentIndex = 1;
                        });
                      } else {
                        Get.showSnackbar(
                          const GetSnackBar(
                            message: 'Password does not match',
                            duration: Duration(seconds: 2),
                            icon: Icon(
                              Icons.warning_amber_outlined,
                              size: 20,
                              color: MainColor.white,
                            ),
                          ),
                        );
                        firstTextController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
            Visibility(
              visible: visibility,
              maintainAnimation: true,
              maintainSize: false,
              maintainState: true,
              child: AnimatedOpacity(
                opacity: (changeState) ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your new password',
                      style: SfTextStyles.fontMedium(
                        color: MainColor.blackLight,
                        fontSize: 16.sp,
                      ),
                    ),
                    8.verticalSpace,
                    CustomProfileTextField(controller: secondTextController),
                    12.verticalSpace,
                    Text(
                      'Verify new password',
                      style: SfTextStyles.fontMedium(
                        color: MainColor.blackLight,
                        fontSize: 16.sp,
                      ),
                    ),
                    8.verticalSpace,
                    CustomProfileTextField(controller: thirdTextController),
                    16.verticalSpace,
                    CustomButtonWidget(
                      title: 'Verify',
                      onTap: () {
                        if (secondTextController.text == thirdTextController.text) {
                          Get.back(result: secondTextController.text);
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: 'Password does not match',
                              duration: Duration(seconds: 2),
                              icon: Icon(
                                Icons.warning_amber_outlined,
                                size: 20,
                                color: MainColor.white,
                              ),
                            ),
                          );
                          secondTextController.clear();
                          thirdTextController.clear();
                        }
                      },
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
