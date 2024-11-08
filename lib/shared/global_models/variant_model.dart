import 'package:hive/hive.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'variant_model.g.dart';

@HiveType(typeId: 3)
class VariantModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String? image;
  @HiveField(2)
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
