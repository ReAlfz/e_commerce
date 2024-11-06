import 'package:e_commerce/features/cart_screen/models/cart_model.dart';

class PriceTruple {
  int totalPrice;
  List<CartModel> listItem;

  PriceTruple({required this.totalPrice, required this.listItem});
}