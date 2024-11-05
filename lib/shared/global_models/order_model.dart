class OrderModel {
  int id_order;
  int id_user;
  int quantity;
  int price;
  String methodPayment;
  String date;

  OrderModel({
    required this.id_order,
    required this.id_user,
    required this.quantity,
    required this.price,
    required this.methodPayment,
    required this.date,
  });
}