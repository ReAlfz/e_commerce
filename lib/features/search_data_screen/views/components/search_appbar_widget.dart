import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/search_data_screen/controllers/search_data_controller.dart';
import 'package:e_commerce/shared/styles/sf_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final ValueChanged<String>? onChange;

  const SearchAppbarWidget({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      toolbarHeight: 0.085.sh,
      automaticallyImplyLeading: false,
      backgroundColor: MainColor.white,
      surfaceTintColor: MainColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.r),
        ),
      ),
      title: Row(
        children: [
          GestureDetector(
            onTap: SearchDataController.to.onBack,
            child: Icon(
              Icons.chevron_left_rounded,
              color: MainColor.blackLight,
              size: 30.r,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Hero(
              tag: 'search-all-product',
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  focusNode: SearchDataController.to.focusNode,
                  controller: SearchDataController.to.textEditingController,
                  onChanged: onChange,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey[400],
                      size: 22.r,
                    ),
                    suffixIcon: Obx(
                      () => GestureDetector(
                        onTap: () {
                          SearchDataController.to.filtered.value = '';
                          SearchDataController.to.textEditingController.clear();
                        },
                        child:
                            (SearchDataController.to.filtered.value.isNotEmpty)
                                ? Icon(
                                    Icons.cancel,
                                    color: MainColor.darkGrey,
                                    size: 14.r,
                                  )
                                : const SizedBox(),
                      ),
                    ),
                    filled: true,
                    fillColor: MainColor.grey,
                    hintText: 'Search the entire shop',
                    hintStyle: SfTextStyles.fontRegular(
                      color: Colors.grey[400]!,
                      fontSize: 14.sp,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.5.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
          5.horizontalSpace,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.085.sh);
}
