import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends GetxService{
  HiveService._();
  static final user = Hive.box('user');
  static final listUser = Hive.box('user-database');
  static final listFavorite = Hive.box('list');

  static saveListUser(List<UserModel> myList) async {
    await listUser.put('user_list', myList);
  }

  static List<UserModel>? getListUser() {
    var dynamicList = listUser.get('user_list', defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as UserModel).toList();
    return [];
  }

  static saveUser(UserModel data) async {
    await user.put('currentUser', data);
  }

  static UserModel? getUser() {
    return user.get('currentUser', defaultValue: null);
  }

  static saveListFavorite(List<ProductModel> myList) async {
    await listFavorite.put('my_list', myList);
  }

  static List<ProductModel>? getListFavorite() {
    var dynamicList = listFavorite.get('my_list', defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as ProductModel).toList();
    return [];
  }

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox('user');
    await Hive.openBox('user-database');
    await Hive.openBox('list');
  }
}