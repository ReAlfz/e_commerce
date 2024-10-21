import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  RxInt currentPage = 0.obs;

  void changePages(int index) {
    currentPage(index);
  }

  bool changeState(int index) {
    return (currentPage.value == index) ? true : false;
  }
}