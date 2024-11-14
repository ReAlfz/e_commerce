import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/voucher_screen/views/components/voucher_appbar_widget.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.grey,
      appBar: VoucherAppbarWidget(
        onChanged: (value) {},
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          color: MainColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
        margin: EdgeInsets.only(top: 8.h),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 120.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
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
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0.025.sw, right: 0.025.sw),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_bag,
                      color: MainColor.darkGrey,
                      size: 80.r,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Promo 10% diskon',
                          style: SfTextStyles.fontMedium(
                            color: MainColor.blackLight,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
