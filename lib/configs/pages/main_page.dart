import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/features/cart_screen/bindings/cart_binding.dart';
import 'package:e_commerce/features/cart_screen/views/ui/cart_view.dart';
import 'package:e_commerce/features/detail_order_screen/bindings/detail_order_binding.dart';
import 'package:e_commerce/features/detail_order_screen/views/ui/detail_order_view.dart';
import 'package:e_commerce/features/detail_product_screen/bindings/detail_product_binding.dart';
import 'package:e_commerce/features/detail_product_screen/views/ui/detail_product_view.dart';
import 'package:e_commerce/features/filter_list_category_view/bindings/filter_list_category_binding.dart';
import 'package:e_commerce/features/filter_list_category_view/views/ui/filter_list_category_view.dart';
import 'package:e_commerce/features/home_screen/bindings/category_binding.dart';
import 'package:e_commerce/features/home_screen/bindings/flashsale_binding.dart';
import 'package:e_commerce/features/home_screen/views/ui/category_view.dart';
import 'package:e_commerce/features/home_screen/views/ui/flashsale_view.dart';
import 'package:e_commerce/features/navigation/bindings/navigation_binding.dart';
import 'package:e_commerce/features/navigation/views/ui/navigation_view.dart';
import 'package:e_commerce/features/search_data_screen/bindings/search_data_binding.dart';
import 'package:e_commerce/features/search_data_screen/views/ui/search_data_view.dart';
import 'package:e_commerce/features/sign_up/bindings/login_binding.dart';
import 'package:e_commerce/features/sign_up/bindings/sign_up_binding.dart';
import 'package:e_commerce/features/sign_up/views/ui/login_view.dart';
import 'package:e_commerce/features/sign_up/views/ui/sign_up_view.dart';
import 'package:e_commerce/features/splash_screen/bindings/splash_binding.dart';
import 'package:e_commerce/features/splash_screen/views/ui/splash_view.dart';
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
    GetPage(
      name: MainRoute.category,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: MainRoute.categoryList,
      page: () => const FilterListCategoryView(),
      binding: FilterListCategoryBinding(),
    ),
    GetPage(
      name: MainRoute.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: MainRoute.search,
      page: () => const SearchDataView(),
      binding: SearchDataBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: MainRoute.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: MainRoute.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: MainRoute.detailOrder,
      page: () => const DetailOrderView(),
      binding: DetailOrderBinding(),
    ),
  ];
}
