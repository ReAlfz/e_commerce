import 'package:e_commerce/features/cart_screen/models/cart_model.dart';

class OrderModel {
  int id_order;
  int id_user;
  int quantity;
  int price;
  String methodPayment;
  String date;
  List<CartModel> listProduct;
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