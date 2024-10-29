class UserModel {
  final int id_user;
  String name;
  String phone;
  String address;
  String email;
  String country;
  String password;
  String photo;

  UserModel({
    required this.id_user,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
    required this.country,
  });
}