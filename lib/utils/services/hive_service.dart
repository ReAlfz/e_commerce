import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveService extends GetxService{
  HiveService._();
  static final user = Hive.box('user');

  static saveUser() {
    user.put('currentUser', 'user');
  }
}