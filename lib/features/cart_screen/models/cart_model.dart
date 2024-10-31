import 'package:e_commerce/shared/global_models/product_model.dart';

class CartModel {
  final int productId;
  final String? variantColor;
  final String? variantSwitch;
  final String title;
  final String description;
  final String images;
  final ProductModel product;
  int quantity;
  int price;

  CartModel({
    required this.productId,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.images,
    required this.product,
    this.variantSwitch,
    this.variantColor,
  });
}
