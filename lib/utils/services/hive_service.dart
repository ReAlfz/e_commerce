import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveService extends GetxService{
  HiveService._();
  static final user = Hive.box('user');
  static final list = Hive.box('list');

  static saveUser() {
    user.put('currentUser', 'user');
  }

  static saveList(List<ProductModel> myList) async {
    await list.put('my_list', myList);
  }

  static List<ProductModel>? getList() {
    return list.get('my_list');
  }
}