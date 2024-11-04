import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/variant_model.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:e_commerce/shared/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomSheetDetail extends StatelessWidget {
  final ProductModel productModel;
  final List<VariantModel>? color;
  final List<VariantModel>? switchOption;

  const BottomSheetDetail({
    super.key,
    this.color,
    this.switchOption,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        color: MainColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 0.1.sh,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    key: DetailProductController.to.imageBottomSheetKey,
                    width: 75.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: MainColor.grey,
                    ),
                    child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) => color != null,
                      widgetBuilder: (context) => Obx(
                        () => Image.asset(
                          color![DetailProductController.to.colorIndex.value]
                              .image!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      fallbackBuilder: (context) => Image.asset(
                        productModel.images.first,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 27.5.h,
                  left: 85.w,
                  child: Obx(
                    () => Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(DetailProductController.to.price.value),
                      style: SfTextStyles.fontMedium(
                        color: MainColor.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 47.5.h,
                  left: 85.w,
                  child: Text(
                    'Stock: ${productModel.stock}',
                    style: SfTextStyles.fontRegular(
                      color: MainColor.darkGrey,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: const Offset(0, -7.5),
                    child: GestureDetector(
                      onTap: Get.back,
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 22.5.r,
                        color: MainColor.darkGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          5.verticalSpace,
          Divider(
            color: MainColor.darkGrey,
            thickness: 0.2,
            indent: 3.w,
            endIndent: 3.w,
          ),
          5.verticalSpace,
          if (color != null) ...[
            Text(
              'Colors',
              style: SfTextStyles.fontMedium(
                fontSize: 12.sp,
                color: MainColor.blackLight,
              ),
            ),
            5.verticalSpace,
            Wrap(
              runSpacing: 5,
              spacing: 15,
              children: List.generate(color!.length, (index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      DetailProductController.to.changeIndex(colorIdx: index);
                      DetailProductController.to.setPrice(
                        colorIdx: index,
                        switchIdx: DetailProductController.to.switchIndex.value,
                      );
                    },
                    child: Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: MainColor.grey,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: (DetailProductController.to.colorIndex.value ==
                                  index)
                              ? MainColor.darkGrey
                              : MainColor.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          5.horizontalSpace,
                          FittedBox(
                            child: Image.asset(
                              height: 25.h,
                              color![index].image!,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          5.horizontalSpace,
                          Flexible(
                            child: Text(
                              color![index].name,
                              style: SfTextStyles.fontRegular(
                                color: MainColor.darkGrey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          7.5.horizontalSpace,
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
          if (switchOption != null) ...[
            26.verticalSpace,
            Text(
              'Switch',
              style: SfTextStyles.fontMedium(
                fontSize: 12.sp,
                color: MainColor.blackLight,
              ),
            ),
            5.verticalSpace,
            Wrap(
              runSpacing: 5,
              spacing: 15,
              children: List.generate(switchOption!.length, (index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      DetailProductController.to.changeIndex(switchIdx: index);
                      DetailProductController.to.setPrice(
                        switchIdx: index,
                        colorIdx: DetailProductController.to.colorIndex.value,
                      );
                    },
                    child: Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: MainColor.grey,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color:
                              (DetailProductController.to.switchIndex.value ==
                                      index)
                                  ? MainColor.darkGrey
                                  : MainColor.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          7.5.horizontalSpace,
                          Text(
                            switchOption![index].name,
                            style: SfTextStyles.fontRegular(
                              fontSize: 12.sp,
                              color: MainColor.darkGrey,
                            ),
                          ),
                          7.5.horizontalSpace,
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
          36.verticalSpace,
          CustomButtonWidget(
            title: 'Add to Cart',
            enabler: true,
            onTap: () {
              DetailProductController.to.convertToCart();
              DetailProductController.to.runAnimationCartNow(
                DetailProductController.to.imageBottomSheetKey,
              );
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
