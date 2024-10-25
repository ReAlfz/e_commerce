import 'package:e_commerce/modules/global_models/variant_model.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final List<VariantModel>? variantColor;
  @HiveField(2)
  final List<VariantModel>? variantSwitch;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final List<String> images;
  @HiveField(6)
  final String category;
  @HiveField(7)
  final int stock;
  @HiveField(8)
  final int price;
  @HiveField(9)
  bool favorite;
  @HiveField(10)
  final double rating;
  @HiveField(11)
  final int totalReview;
  @HiveField(12)
  final double goodReview;
  @HiveField(13)
  final int numberChat;

  ProductModel({
    required this.productId,
    this.variantColor,
    this.variantSwitch,
    required this.title,
    required this.description,
    required this.category,
    required this.stock,
    required this.favorite,
    required this.price,
    required this.images,
    required this.goodReview,
    required this.numberChat,
    required this.rating,
    required this.totalReview,
  });
}
