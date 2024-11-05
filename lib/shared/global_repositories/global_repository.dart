import 'package:dio/dio.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class GlobalRepository {
  Future<List<ProductModel>> getProducts() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://fd88ee49-56e4-4547-9d11-d66fda2f4071.mock.pstmn.io',
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    try {
      const url = '/products';
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
