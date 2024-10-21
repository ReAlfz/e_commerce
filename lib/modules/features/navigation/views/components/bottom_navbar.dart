import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/modules/features/navigation/views/components/item_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Container(
        height: 0.075.sh,
        color: MainColor.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemNavbar(
              onTap: () => NavigationController.to.changePages(0),
              filledIcon: Icons.home,
              icon: Icons.home_outlined,
              index: 0,
              title: 'Home',
            ),
            ItemNavbar(
              onTap: () => NavigationController.to.changePages(1),
              filledIcon: Icons.favorite,
              icon: Icons.favorite_outline,
              index: 1,
              title: 'Favorites',
            ),
            ItemNavbar(
              onTap: () => NavigationController.to.changePages(2),
              filledIcon: Icons.shopping_cart,
              icon: Icons.shopping_cart_outlined,
              index: 2,
              title: 'Cart',
            ),
            ItemNavbar(
              onTap: () => NavigationController.to.changePages(3),
              filledIcon: Icons.person_2,
              icon: Icons.person_2_outlined,
              index: 3,
              title: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
