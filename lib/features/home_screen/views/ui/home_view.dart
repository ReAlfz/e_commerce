import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/home_screen/controllers/home_controller.dart';
import 'package:e_commerce/features/home_screen/views/components/categories_widget.dart';
import 'package:e_commerce/features/home_screen/views/components/custom_sliver_appbar.dart';
import 'package:e_commerce/features/home_screen/views/components/flash_sale_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 8.r),
                    height: 135.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      itemCount: HomeController.to.listVoucher.length,
                      itemBuilder: (context, index) {
                        final data = HomeController.to.listVoucher[index];
                        return GestureDetector(
                          onTap: () => HomeController.to.toVoucherDetail(index),
                          child: Container(
                            width: 0.85.sw,
                            margin: EdgeInsets.symmetric(
                              vertical: 2.h,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              color: MainColor.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  spreadRadius: 0.2,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 0.025.sw,
                                    right: 0.025.sw,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.shopping_bag,
                                    color: MainColor.darkGrey,
                                    size: 70.r,
                                  ),
                                ),
                                14.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.title,
                                        style: SfTextStyles.fontMedium(
                                          color: MainColor.blackLight,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        data.termCondition,
                                        style: SfTextStyles.fontRegular(
                                          color: MainColor.blackLight,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
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
