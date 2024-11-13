import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/profile_screen/controllers/profile_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      toolbarHeight: 0.085.sh,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.r),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Account',
              style: SfTextStyles.fontBold(
                color: MainColor.black,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.085.sh);
}
