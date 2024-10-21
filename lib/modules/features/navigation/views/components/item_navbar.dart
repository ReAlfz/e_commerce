import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemNavbar extends StatelessWidget {
  final int index;
  final String title;
  final VoidCallback onTap;
  final IconData filledIcon;
  final IconData icon;

  const ItemNavbar(
      {super.key,
      required this.onTap,
      required this.filledIcon,
      required this.icon,
      required this.index,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  (NavigationController.to.changeState(index))
                      ? filledIcon
                      : icon,
                  color: (NavigationController.to.changeState(index))
                      ? MainColor.primary
                      : MainColor.darkGrey,
                  size: 25.r,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'sf reguler',
                    color: (NavigationController.to.changeState(index))
                        ? MainColor.black
                        : MainColor.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
