import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  void onBack() => Get.back();

  void toFilterCategory(int index) {
    final data = Dataset.catalog[index].title;
    Get.toNamed(MainRoute.categoryList, arguments: data);
  }
}