import 'package:sentry_flutter/sentry_flutter.dart';

class VariantModel {
  final String name;
  final String? image;
  final int price;

  VariantModel({
    required this.name,
    required this.price,
    this.image,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    try {
      return VariantModel(
        name: json["name"],
        price: json["price"],
        image: json["image"] ?? '',
      );
    } catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
