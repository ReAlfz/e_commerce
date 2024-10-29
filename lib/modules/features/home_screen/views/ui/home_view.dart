import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/home_screen/views/components/categories_widget.dart';
import 'package:e_commerce/modules/features/home_screen/views/components/flash_sale_widget.dart';
import 'package:e_commerce/modules/features/home_screen/views/components/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              const CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 8.r),
                  decoration: BoxDecoration(
                    color: MainColor.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      const CategoriesWidget(),
                      20.verticalSpace,
                      const FlashSaleWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
