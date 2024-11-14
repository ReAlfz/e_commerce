import 'package:sentry_flutter/sentry_flutter.dart';

class VoucherModel {
  String title;
  String termCondition;
  int price;
  int? maxPrice;
  String description;

  VoucherModel({
    required this.title,
    required this.price,
    required this.description,
    required this.termCondition,
    this.maxPrice,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    try {
      return VoucherModel(
        title: json['title'],
        price: json['price'],
        maxPrice: json['max_price'] ?? 0,
        description: json['description'],
        termCondition: json['termCondition'],
      );
    } catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
