import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartModel {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String? variantColor;
  @HiveField(2)
  final String? variantSwitch;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String images;
  @HiveField(6)
  final ProductModel product;
  @HiveField(7)
  int quantity;
  @HiveField(8)
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
