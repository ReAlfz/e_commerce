import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/modules/global_models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveService extends GetxService{
  HiveService._();
  static final user = Hive.box('user');
  static final userDatabase = Hive.box('user-database');
  static final list = Hive.box('list');

  static saveNewUser(List<UserModel> myList) async {
    await userDatabase.put('user_list', myList);
  }

  static List<UserModel>? getUserList() {
    var dynamicList = userDatabase.get('user_list', defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as UserModel).toList();
    return [];
  }

  static saveUser(UserModel data) async {
    await user.put('currentUser', data);
  }

  static UserModel? getUser() {
    return user.get('currentUser', defaultValue: null);
  }

  static saveList(List<ProductModel> myList) async {
    await list.put('my_list', myList);
  }

  static List<ProductModel>? getList() {
    var dynamicList = list.get('my_list', defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as ProductModel).toList();
    return [];
  }
}