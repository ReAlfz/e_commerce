import 'package:e_commerce/shared/global_models/variant_model.dart';
import 'package:hive/hive.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  final num rating;
  @HiveField(11)
  final int totalReview;
  @HiveField(12)
  final num goodReview;
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        productId: json["productId"],
        title: json["title"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        category: json["category"],
        favorite: json["favorite"],
        images: List<String>.from(json["images"].map((x) => x)),
        variantColor: json["variantColor"] == null
            ? null
            : List<VariantModel>.from(
                json["variantColor"]!.map((x) => VariantModel.fromJson(x)),
              ),
        variantSwitch: json["variantSwitch"] == null
            ? null
            : List<VariantModel>.from(
                json["variantSwitch"]!.map((x) => VariantModel.fromJson(x)),
              ),
        rating: json["rating"],
        goodReview: json["goodReview"],
        numberChat: json["numberChat"],
        totalReview: json["totalReview"],
      );
    } catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
