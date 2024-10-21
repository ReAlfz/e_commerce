import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/modules/features/detail_product_screen/bindings/detail_product_binding.dart';
import 'package:e_commerce/modules/features/detail_product_screen/views/ui/detail_product_view.dart';
import 'package:e_commerce/modules/features/home_screen/bindings/flashsale_binding.dart';
import 'package:e_commerce/modules/features/home_screen/views/ui/flashsale_view.dart';
import 'package:e_commerce/modules/features/navigation/bindings/navigation_binding.dart';
import 'package:e_commerce/modules/features/navigation/views/ui/navigation_view.dart';
import 'package:e_commerce/modules/features/splash_screen/bindings/splash_binding.dart';
import 'package:e_commerce/modules/features/splash_screen/views/ui/splash_view.dart';
import 'package:get/get.dart';

class MainPage {
  static final main = [
    GetPage(
      name: MainRoute.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: MainRoute.home,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: MainRoute.flashSaleDetail,
      page: () => const FlashSaleView(),
      binding: FlashSaleBinding(),
    ),
    GetPage(
      name: MainRoute.detailProduct,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
