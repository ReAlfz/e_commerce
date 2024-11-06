import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends GetxService{
  HiveService._();
  static const userSessionKey = 'user';
  static const listUserKey = 'user-database';
  static const listFavoriteKey = 'favorite-list';
  static const listTransactionKey = 'transaction-list';

  static final user = Hive.box(userSessionKey);
  static final listTransaction = Hive.box(listTransactionKey);
  static final listUser = Hive.box(listUserKey);
  static final listFavorite = Hive.box(listFavoriteKey);
  
  /// Transaction database ///
  static const transactionKey = 'transaction-data';
  static saveListTransaction(List<OrderModel> myList) async {
    await listTransaction.put(transactionKey, myList);
  }
  
  static List<OrderModel>? getListTransaction() {
    var dynamicList = listTransaction.get(transactionKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as OrderModel).toList();
    return [];
  }

  /// User database ///
  static const userKey = 'user-data';
  static saveListUser(List<UserModel> myList) async {
    await listUser.put(userKey, myList);
  }

  static List<UserModel>? getListUser() {
    var dynamicList = listUser.get(userKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as UserModel).toList();
    return [];
  }

  /// User session ///
  static const sessionKey = 'session-data';
  static saveUser(UserModel data) async {
    await user.put(sessionKey, data);
  }

  static UserModel? getUser() {
    return user.get(sessionKey, defaultValue: null);
  }

  /// Favorite database ///
  static const favoriteKey = 'favorite-data';
  static saveListFavorite(List<ProductModel> myList) async {
    await listFavorite.put(favoriteKey, myList);
  }

  static List<ProductModel>? getListFavorite() {
    var dynamicList = listFavorite.get(favoriteKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as ProductModel).toList();
    return [];
  }
  
  /// Get Database ///

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(OrderModelAdapter());
    await Hive.openBox(userSessionKey);
    await Hive.openBox(listUserKey);
    await Hive.openBox(listTransactionKey);
    await Hive.openBox(listFavoriteKey);
  }
}