import 'package:e_commerce/features/search_data_screen/controllers/search_data_controller.dart';
import 'package:get/get.dart';

class SearchDataBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SearchDataController());
  }
}