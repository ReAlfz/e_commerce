import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/appbar_widget_detail.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/image_slider_widget.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/product_shimmer_detail.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/read_more_widget.dart';
import 'package:e_commerce/features/detail_product_screen/views/components/review_widget.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailProductView extends StatefulWidget {
  const DetailProductView({super.key});

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  GlobalKey imageBottomSheetKey = GlobalKey();
  GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: GlobalController.to.cartKey,
      height: 40.h,
      width: 40.w,
      dragAnimation: const DragToCartAnimationOptions(
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      ),
      jumpAnimation: JumpAnimationOptions(
        duration: const Duration(milliseconds: 300),
        active: DetailProductController.to.jumpOption(),
      ),
      createAddToCartAnimation: (runAnimation) {
        DetailProductController.to.runCartAnimation = runAnimation;
      },
      child: Scaffold(
        backgroundColor: MainColor.grey,
        resizeToAvoidBottomInset: false,
        appBar: const AppbarWidgetDetail(),
        body: Obx(
          () => Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                DetailProductController.to.state.value,
            fallbackBuilder: (context) => const ProductShimmerDetail(),
            widgetBuilder: (context) {
              final data = DetailProductController.to.productData.value!;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ImageSliderWidget(imageKey: imageKey),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 18.h,
                      ),
                      decoration: BoxDecoration(
                        color: MainColor.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: SfTextStyles.fontMedium(
                              color: MainColor.black,
                              fontSize: 21.sp,
                            ),
                          ),
                          8.verticalSpace,
                          ReviewWidget(data: data),
                          16.verticalSpace,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: MainColor.grey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(DetailProductController.to.price.value),
                              style: SfTextStyles.fontSemiBold(
                                color: MainColor.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          ReadMoreWidget(text: data.description),
                          const Spacer(),
                          16.verticalSpace,
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButtonWidget(
                              title: 'Add to Cart',
                              onTap: () =>
                                  DetailProductController.to.createOrder(
                                imageKey: imageKey,
                                imageBottomSheetKey: imageBottomSheetKey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
