import 'package:e_commerce/features/voucher_screen/models/voucher_model.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/utils/services/dio_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class GlobalRepository {
  Future<List<ProductModel>> getProducts() async {
    final dio = DioService.callApi();
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

  Future<List<VoucherModel>> getVoucher() async {
    final dio = DioService.callApi();
    try {
      const url = '/vouchers';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        return List<VoucherModel>.from(
          responseData['vouchers'].map((x) => VoucherModel.fromJson(x)),
        );
      }
    } catch (e, stackTrace) {
      await Sentry.captureException(e, stackTrace: stackTrace);
    }

    return [];
  }
}
