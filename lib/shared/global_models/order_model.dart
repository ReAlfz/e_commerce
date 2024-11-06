import 'package:e_commerce/features/cart_screen/models/cart_model.dart';
import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 2)
class OrderModel {
  @HiveField(0)
  int id_order;
  @HiveField(1)
  int id_user;
  @HiveField(2)
  int quantity;
  @HiveField(3)
  int price;
  @HiveField(4)
  String methodPayment;
  @HiveField(5)
  String date;
  @HiveField(6)
  List<CartModel> listProduct;
  @HiveField(7)
  int status;

  OrderModel({
    required this.id_order,
    required this.id_user,
    required this.quantity,
    required this.price,
    required this.methodPayment,
    required this.date,
    required this.listProduct,
    required this.status,
  });
}