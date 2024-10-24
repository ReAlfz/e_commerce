import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/constants/cores/datas/dataset.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';

class FilterListCategoryController extends GetxController {
  static FilterListCategoryController get to => Get.find();

  RxList<ProductModel> listCategory = <ProductModel>[].obs;
  late String title;
  RxString filtered = ''.obs;

  @override
  void onInit() async {
    title = Get.arguments;
    final list =
        Dataset.list.where((element) => title == element.category).toList();
    listCategory(list);
    super.onInit();
  }

  List<ProductModel> get filteredList => (filtered.value.isNotEmpty)
      ? listCategory
          .where((element) =>
              element.title.toLowerCase().contains(filtered.value.toLowerCase()))
          .toList()
      : listCategory;

  void toDetail(int index) {
    final data = filteredList[index];
    Get.toNamed(MainRoute.detailProduct, arguments: data);
  }

  void onBack() => Get.until((route) => Get.currentRoute == MainRoute.home);
}
