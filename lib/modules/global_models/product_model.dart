import 'package:e_commerce/modules/global_models/variant_model.dart';

class ProductModel {
  final int productId;
  final List<VariantModel>? variantColor;
  final List<VariantModel>? variantSwitch;
  final String title;
  final String description;
  final List<String> images;
  final int stock;
  final int price;

  ProductModel({
    required this.productId,
    this.variantColor,
    this.variantSwitch,
    required this.title,
    required this.description,
    required this.stock,
    required this.price,
    required this.images,
  });
}
