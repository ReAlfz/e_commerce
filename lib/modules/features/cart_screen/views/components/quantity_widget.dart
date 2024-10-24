import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityWidget({super.key, required this.quantity, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (quantity > 0)
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: MainColor.grey,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onDecrement,
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: Icon(
                    Icons.remove,
                    size: 12.r,
                    color: MainColor.black,
                  ),
                ),
              ),
            ),
          ),
        if (quantity > 0) Container(
          constraints: BoxConstraints(minWidth: 20.r),
          padding: EdgeInsets.symmetric(horizontal: 5.r),
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: MainColor.black,
              fontFamily: 'sf medium',
            ),
          ),
        ),

        if (quantity > 0)
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: MainColor.grey,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onIncrement,
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: Icon(
                    Icons.add,
                    size: 12.r,
                    color: MainColor.black,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
