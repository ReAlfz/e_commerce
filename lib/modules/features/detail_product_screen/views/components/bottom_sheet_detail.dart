import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/modules/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/modules/global_models/variant_model.dart';
import 'package:e_commerce/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomSheetDetail extends StatefulWidget {
  final ProductModel productModel;
  final List<VariantModel>? color;
  final List<VariantModel>? switchOption;

  const BottomSheetDetail(
      {super.key, this.color, this.switchOption, required this.productModel});

  @override
  State<BottomSheetDetail> createState() => _BottomSheetDetailState();
}

class _BottomSheetDetailState extends State<BottomSheetDetail> {
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
                    width: 75.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: MainColor.grey,
                    ),
                    child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) => widget.color != null,
                      widgetBuilder: (context) => Obx(
                            () => Image.asset(
                          widget
                              .color![
                          DetailProductController.to.colorIndex.value]
                              .image!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      fallbackBuilder: (context) => Image.asset(
                        widget.productModel.images.first,
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
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MainColor.black,
                        fontFamily: 'sf medium',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 47.5.h,
                  left: 85.w,
                  child: Text(
                    'Stock: ${widget.productModel.stock}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: MainColor.darkGrey,
                      fontFamily: 'sf reguler',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: const Offset(0, -7.5),
                    child: GestureDetector(
                      onTap: DetailProductController.to.onBack,
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
          if (widget.color != null) ...[
            Text(
              'Colors',
              style: TextStyle(
                fontSize: 12.sp,
                color: MainColor.blackLight,
                fontFamily: 'sf medium',
              ),
            ),
            5.verticalSpace,
            Wrap(
              runSpacing: 5,
              spacing: 15,
              children: List.generate(widget.color!.length, (index) {
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
                              widget.color![index].image!,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          5.horizontalSpace,
                          Flexible(
                            child: Text(
                              widget.color![index].name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: MainColor.darkGrey,
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
          if (widget.switchOption != null) ...[
            26.verticalSpace,
            Text(
              'Switch',
              style: TextStyle(
                fontSize: 12.sp,
                color: MainColor.blackLight,
                fontFamily: 'sf medium',
              ),
            ),
            5.verticalSpace,
            Wrap(
              runSpacing: 5,
              spacing: 15,
              children: List.generate(widget.switchOption!.length, (index) {
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
                            widget.switchOption![index].name,
                            style: TextStyle(
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
          CustomButton(
            title: 'Add to Cart',
            onTap: () {
              DetailProductController.to.convertToCart();
              DetailProductController.to.onBack();
            },
          ),
        ],
      ),
    );
  }
}
