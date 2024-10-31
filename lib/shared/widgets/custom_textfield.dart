import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isObscure;
  final bool isRequired;
  final String requiredText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.isObscure,
      required this.isRequired,
      required this.requiredText,
      required this.keyboardType,
      required this.controller, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Text(
            label,
            style: TextStyle(
              color: MainColor.blackLight,
              fontSize: 14.sp,
              fontFamily: 'sf medium',
            ),
          ),
        ),
        4.verticalSpace,
        TextFormField(
          keyboardType: keyboardType,
          obscureText: isObscure,
          onChanged: (text) => controller.text = text,
          validator: (String? value) {
            if (isRequired) {
              String trim = value!.trim();
              if (trim.isEmpty) return requiredText;
            }

            return null;
          },
          style: TextStyle(
            fontSize: 14.sp,
            color: MainColor.blackLight,
            fontFamily: 'sf reguler',
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            suffixIcon: suffixIcon,
            fillColor: Colors.white60,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.2.r, color: MainColor.blackLight)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.2.r, color: MainColor.secondaryDark)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(width: 1.2.r, color: MainColor.secondaryDark)
            ),
          ),
        ),
      ],
    );
  }
}
