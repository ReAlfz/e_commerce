import 'package:e_commerce/modules/features/favorite_screen/views/ui/favorite_view.dart';
import 'package:e_commerce/modules/features/home_screen/views/ui/home_view.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/modules/features/navigation/views/components/bottom_navbar_widget.dart';
import 'package:e_commerce/modules/features/profile_screen/views/ui/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => IndexedStack(
              index: NavigationController.to.currentPage.value,
              children: const [
                HomeView(),
                FavoriteView(),
                Scaffold(),
                ProfileView(),
              ],
            ),
          ),
        ),
        const BottomNavBarWidget(),
      ],
    );
  }
}
