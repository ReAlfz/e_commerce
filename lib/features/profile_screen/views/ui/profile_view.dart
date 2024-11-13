import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/profile_screen/controllers/profile_controller.dart';
import 'package:e_commerce/features/profile_screen/views/components/no_user_widget.dart';
import 'package:e_commerce/features/profile_screen/views/components/profile_appbar_widget.dart';
import 'package:e_commerce/features/profile_screen/views/components/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: const ProfileAppbarWidget(),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        margin: EdgeInsets.only(top: 8.r),
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        child: Obx(
          () => Conditional.single(
            context: context,
            conditionBuilder: (context) => ProfileController.to.user.value != null,
            fallbackBuilder: (context) => const NoUserWidget(),
            widgetBuilder: (context) => const UserWidget(),
          ),
        ),
      ),
    );
  }
}
