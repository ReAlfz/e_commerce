import 'package:dio/dio.dart';

class DioService {
  DioService._();
  static final DioService dioService = DioService._();
  factory DioService() => dioService;

  static Dio callApi() {
    var header = {
      'Content-Type' : 'application/json',
      'Accept': 'application/json',
    };

    Dio dio = Dio(
      BaseOptions(
        headers: header,
        baseUrl: 'https://fd88ee49-56e4-4547-9d11-d66fda2f4071.mock.pstmn.io',
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    return dio;
  }
}