import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final int id_user;
  @HiveField(1)
  String name;
  @HiveField(2)
  String phone;
  @HiveField(3)
  String address;
  @HiveField(4)
  String email;
  @HiveField(5)
  String country;
  @HiveField(6)
  String password;
  @HiveField(7)
  String photo;
  @HiveField(8)
  int pin;

  UserModel({
    required this.id_user,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    required this.email,
    required this.pin,
    required this.password,
    required this.country,
  });
}