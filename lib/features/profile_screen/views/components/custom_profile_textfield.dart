import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTextField extends StatefulWidget {
  final TextEditingController controller;
  const CustomProfileTextField({super.key, required this.controller});

  @override
  State<CustomProfileTextField> createState() => _CustomProfileTextFieldState();
}

class _CustomProfileTextFieldState extends State<CustomProfileTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      obscureText: showPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        suffixIcon: GestureDetector(
          onTap: () => setState(() => showPassword = !showPassword),
          child: (showPassword)
              ? Icon(
                  Icons.visibility_outlined,
                  color: MainColor.blackLight,
                  size: 14.r,
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  color: MainColor.blackLight,
                  size: 14.r,
                ),
        ),
        fillColor: Colors.white60,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.2.r,
            color: MainColor.blackLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.2.r,
            color: MainColor.secondaryDark,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.2.r,
            color: MainColor.secondaryDark,
          ),
        ),
      ),
    );
  }
}
