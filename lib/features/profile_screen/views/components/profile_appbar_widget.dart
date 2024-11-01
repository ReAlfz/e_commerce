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
            Hero(
              tag: 'sign',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'Account',
                  style: SfTextStyles.fontBold(
                    color: MainColor.black,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isDense: true,
                customButton: Icon(
                  Icons.more_horiz,
                  color: MainColor.secondaryDark,
                  size: 25.r,
                ),
                onChanged: (value) => ProfileController.to.toPush(value),
                items: ProfileController.to.dropdownList.map((item) {
                  return DropdownMenuItem(
                    value: item.route,
                    child: Text(
                      item.title,
                      style: SfTextStyles.fontMedium(
                        color: MainColor.blackLight,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }).toList(),
                dropdownStyleData: DropdownStyleData(
                  width: 100.w,
                  elevation: 1,
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 8),
                  maxHeight: 200,
                ),
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
