import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/detail_product_screen/controllers/detail_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderWidget extends StatelessWidget {
  final GlobalKey imageKey;
  const ImageSliderWidget({super.key, required this.imageKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.45.sh,
      color: MainColor.grey,
      child: Obx(
        () => Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.transparent,
              key: imageKey,
              padding: EdgeInsets.only(bottom: 0.085.sh),
              child: CarouselSlider.builder(
                itemCount:
                    DetailProductController.to.productData.value!.images.length,
                itemBuilder: (context, index, realIndex) {
                  final image = DetailProductController
                      .to.productData.value!.images[index];
                  return Image.asset(image);
                },
                options: CarouselOptions(
                  initialPage: 0,
                  enlargeCenterPage: true,
                  disableCenter: false,
                  enableInfiniteScroll: (DetailProductController
                              .to.productData.value!.images.length <=
                          1)
                      ? false
                      : true,
                  onPageChanged: (index, reason) {
                    DetailProductController.to.currentPages.value = index;
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 0.03.sh),
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: DetailProductController.to.currentPages.value,
                count:
                    DetailProductController.to.productData.value!.images.length,
                effect: WormEffect(
                  dotWidth: 7.5.r,
                  dotHeight: 7.5.r,
                  dotColor: MainColor.darkGrey,
                  activeDotColor: MainColor.blackLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
