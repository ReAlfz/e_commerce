import 'package:e_commerce/modules/features/filter_list_category_view/controllers/filter_list_category_controller.dart';
import 'package:get/get.dart';

class FilterListCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FilterListCategoryController());
  }
}