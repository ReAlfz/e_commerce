import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TransactionAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.085.sh,
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(22.5.r),
        ),
      ),
      child: TabBar(
        unselectedLabelColor: MainColor.darkGrey,
        dividerColor: Colors.transparent,
        physics: const BouncingScrollPhysics(),
        indicatorColor: MainColor.secondaryDark,
        labelStyle: SfTextStyles.fontBold(
          color: MainColor.black,
          fontSize: 16.sp,
        ),
        tabs: const [
          Tab(text: 'On Going'),
          Tab(text: 'History'),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(0.085.sh);
}
