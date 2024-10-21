import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  final VoidCallback? onTap;
  const CustomCheckBoxWidget({super.key, this.onTap});

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() => _isChecked = !_isChecked);
    widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isChecked ? MainColor.secondary : Colors.transparent,
          border: Border.all(
            color: _isChecked ? MainColor.secondary : MainColor.darkGrey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        width: 18.r,
        height: 18.r,
        child: Center(
          child: _isChecked
              ? const Icon(
            Icons.check_rounded,
            size: 18.0,
            color: MainColor.white,
          ) : null,
        ),
      ),
    );
  }
}