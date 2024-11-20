import 'dart:math';

import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/sign_up/controllers/sign_controller.dart';
import 'package:e_commerce/features/sign_up/views/components/custom_background.dart';
import 'package:e_commerce/features/sign_up/views/components/login_widget.dart';
import 'package:e_commerce/features/sign_up/views/components/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignView extends StatelessWidget {
  const SignView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: MainColor.grey,
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackGround(),
              GestureDetector(
                onTap: SignController.to.onBack,
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
              AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut.flipped,
                duration: const Duration(milliseconds: 800),
                layoutBuilder: (currentChild, previousChildren) => Stack(
                  children: [
                    currentChild!,
                    ...previousChildren,
                  ],
                ),
                transitionBuilder: (child, animation) {
                  final rotate =
                      Tween<double>(begin: pi, end: 0).animate(animation);
                  return AnimatedBuilder(
                    animation: animation,
                    child: child,
                    builder: (context, child) {
                      final isKey =
                          ValueKey(SignController.to.currentState.value) !=
                              child!.key;
                      var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
                      tilt *= isKey ? -1.0 : 1.0;
                      final value =
                          (isKey) ? min(rotate.value, pi / 2) : rotate.value;
                      return FadeTransition(
                        opacity: animation,
                        child: Transform(
                          transform: Matrix4.rotationY(value)
                            ..setEntry(3, 0, tilt),
                          alignment: Alignment.center,
                          child: child,
                        ),
                      );
                    },
                  );
                },
                child: Obx(
                  () => (SignController.to.currentState.value)
                      ? Container(
                          key: const ValueKey(true),
                          child: const LoginWidget(),
                        )
                      : Container(
                          key: const ValueKey(false),
                          child: const SignUpWidget(),
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
