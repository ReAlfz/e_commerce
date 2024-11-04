import 'package:dio/dio.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class GlobalRepository {
  Future<List<ProductModel>> getProducts() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://run.mocky.io/v3/',
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    try {
      const url = '54094c63-2b6a-4820-b9b8-c968b89d659f';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        return List<ProductModel>.from(
          responseData['products'].map((x) => ProductModel.fromJson(x)),
        ).toList();
      }

    } catch (e, stackTrace) {
      await Sentry.captureException(e, stackTrace: stackTrace);
    }

    return [];
  }
}
