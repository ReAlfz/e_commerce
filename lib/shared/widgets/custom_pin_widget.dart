import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinWidget extends StatefulWidget {
  final String title;
  final Function(String? value) onSubmit;
  final TextEditingController pinController;
  final bool isObscure;
  const CustomPinWidget({super.key, required this.title, required this.onSubmit, required this.pinController, required this.isObscure});

  @override
  State<CustomPinWidget> createState() => _CustomPinWidgetState();
}

class _CustomPinWidgetState extends State<CustomPinWidget> {
  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 50.w,
      height: 35.h,
      textStyle: SfTextStyles.fontMedium(),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: MainColor.blackLight)
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 12.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: SfTextStyles.fontMedium(
              color: MainColor.blackLight,
              fontSize: 16.sp,
            ),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child:Pinput(
                  controller: widget.pinController,
                  showCursor: false,
                  length: 6,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  closeKeyboardWhenCompleted: false,
                  defaultPinTheme: pinTheme,
                  obscuringCharacter: '*',
                  obscureText: widget.isObscure,
                  onSubmitted: widget.onSubmit,
                  onCompleted: widget.onSubmit,
                  separatorBuilder: (index) {
                    return (index == 1 || index == 3)
                        ? Text('-', style: SfTextStyles.fontBold(fontSize: 16))
                        : const SizedBox();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
