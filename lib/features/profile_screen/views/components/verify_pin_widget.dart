import 'dart:async';

import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyPinWidget extends StatefulWidget {
  final String pinValue;

  const VerifyPinWidget({super.key, required this.pinValue});

  @override
  State<VerifyPinWidget> createState() => _VerifyPinWidgetState();
}

class _VerifyPinWidgetState extends State<VerifyPinWidget> {
  bool changePin = false;
  int currentIndex = 0;
  String firstValue = '';
  final pinController1 = TextEditingController();
  final pinController2 = TextEditingController();
  final pinFocus = FocusNode();
  final pinTheme = PinTheme(
    width: 50.w,
    height: 35.h,
    textStyle: SfTextStyles.fontMedium(),
    margin: EdgeInsets.symmetric(horizontal: 3.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: MainColor.blackLight),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 30.r),
      child: Material(
        color: Colors.transparent,
        child: Conditional.single(
          context: context,
          conditionBuilder: (context) => widget.pinValue.length < 6,
          widgetBuilder: (context) => IndexedStack(
            index: currentIndex,
            children: [
              AnimatedOpacity(
                opacity: (!changePin) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: CustomPinWidget(
                  title: 'Input your pin',
                  pinController: pinController1,
                  onSubmit: (value) {
                    firstValue = value!;
                    Timer(
                      const Duration(milliseconds: 400),
                      () => setState(() {
                        changePin = true;
                        currentIndex = 1;
                        FocusManager.instance.primaryFocus?.unfocus();
                      }),
                    );
                    Timer(
                      const Duration(milliseconds: 800),
                      pinFocus.requestFocus,
                    );
                  },
                  isObscure: true,
                ),
              ),
              AnimatedOpacity(
                opacity: (changePin) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: CustomPinWidget(
                  title: 'Verify your pin',
                  onSubmit: (value) {
                    if (value == firstValue) {
                      Get.back(result: firstValue);
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: 'Verification pin does not match',
                          duration: Duration(seconds: 2),
                          icon: Icon(
                            Icons.warning_amber_outlined,
                            size: 20,
                            color: MainColor.white,
                          ),
                        ),
                      );
                      pinController2.clear();
                    }
                  },
                  pinController: pinController2,
                  focusNode: pinFocus,
                  isObscure: true,
                ),
              ),
            ],
          ),
          fallbackBuilder: (context) => IndexedStack(
            index: currentIndex,
            children: [
              AnimatedOpacity(
                opacity: (!changePin) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: CustomPinWidget(
                  title: 'Input your old pin',
                  onSubmit: (value) {
                    if (value == widget.pinValue) {
                      Timer(
                        const Duration(milliseconds: 400),
                        () => setState(() {
                          changePin = true;
                          currentIndex = 1;
                          FocusManager.instance.primaryFocus?.unfocus();
                        }),
                      );
                      Timer(
                        const Duration(milliseconds: 800),
                        pinFocus.requestFocus,
                      );
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: 'pin does not match',
                          duration: Duration(seconds: 2),
                          icon: Icon(
                            Icons.warning_amber_outlined,
                            size: 20,
                            color: MainColor.white,
                          ),
                        ),
                      );
                      pinController1.clear();
                    }
                  },
                  isObscure: true,
                  pinController: pinController1,
                ),
              ),
              AnimatedOpacity(
                opacity: (changePin) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: CustomPinWidget(
                  title: 'Input your new pin',
                  onSubmit: (value) => Get.back(result: value),
                  pinController: pinController2,
                  focusNode: pinFocus,
                  isObscure: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
