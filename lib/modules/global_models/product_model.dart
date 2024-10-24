import 'package:e_commerce/modules/global_models/variant_model.dart';

class ProductModel {
  final int productId;
  final List<VariantModel>? variantColor;
  final List<VariantModel>? variantSwitch;
  final String title;
  final String description;
  final List<String> images;
  final String category;
  final int stock;
  final int price;
  bool favorite;
  final double rating;
  final int totalReview;
  final double goodReview;
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
