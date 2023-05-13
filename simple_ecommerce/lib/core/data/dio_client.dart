import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/config.dart';

class DioClient {
  late Dio _dio;

  Future<void> onInit() async {
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl, headers: {'Content-type': 'application/json'}));
    initInterceptor();
  }

  void initInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onError: (e, handler) {
        return handler.next(e);
      },
      onResponse: (e, handler) {
        return handler.next(e);
      },
    ));
  }
}
