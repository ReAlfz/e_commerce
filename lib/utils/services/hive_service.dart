import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:e_commerce/shared/global_models/order_model.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/shared/global_models/variant_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends GetxService{
  HiveService._();
  static const _userSessionKey = 'user';
  static const _listUserKey = 'user-database';
  static const _listFavoriteKey = 'favorite-list';
  static const _listTransactionKey = 'transaction-list';

  static final user = Hive.box(_userSessionKey);
  static final listTransaction = Hive.box(_listTransactionKey);
  static final listUser = Hive.box(_listUserKey);
  static final listFavorite = Hive.box(_listFavoriteKey);
  
  /// Transaction database ///
  static const _transactionKey = 'transaction-data';
  static saveListTransaction(List<OrderModel> myList) async {
    await listTransaction.put(_transactionKey, myList);
  }
  
  static List<OrderModel>? getListTransaction() {
    var dynamicList = listTransaction.get(_transactionKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as OrderModel).toList();
    return [];
  }

  /// User database ///
  static const _userKey = 'user-data';
  static saveListUser(List<UserModel> myList) async {
    await listUser.put(_userKey, myList);
  }

  static List<UserModel>? getListUser() {
    var dynamicList = listUser.get(_userKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as UserModel).toList();
    return [];
  }

  /// User session ///
  static const _sessionKey = 'session-data';
  static saveUser(UserModel data) async {
    await user.put(_sessionKey, data);
  }

  static UserModel? getUser() {
    return user.get(_sessionKey, defaultValue: null);
  }

  /// Favorite database ///
  static const _favoriteKey = 'favorite-data';
  static saveListFavorite(List<ProductModel> myList) async {
    await listFavorite.put(_favoriteKey, myList);
  }

  static List<ProductModel>? getListFavorite() {
    var dynamicList = listFavorite.get(_favoriteKey, defaultValue: []);
    if (dynamicList is List) return dynamicList.map((item) => item as ProductModel).toList();
    return [];
  }
  
  /// Get Database ///

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(VariantModelAdapter());
    Hive.registerAdapter(OrderModelAdapter());
    Hive.registerAdapter(CartModelAdapter());

    await Hive.openBox(_userSessionKey);
    await Hive.openBox(_listUserKey);
    await Hive.openBox(_listTransactionKey);
    await Hive.openBox(_listFavoriteKey);
  }
}