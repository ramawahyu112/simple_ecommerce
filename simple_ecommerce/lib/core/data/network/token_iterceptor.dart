import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/utils/session_helper.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers['requires-token'] == 'false') {
      options.headers.remove('requiresToken');
      return handler.next(options);
    }
    var token = Session().getToken();
    if (token.isNotEmpty) {
      options.headers
          .addAll({'authorization': 'Bearer $token', 'accept': 'application/json'});
      return handler.next(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printInfo(info: response.statusCode.toString());
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == 401) {
      Session().clearSession();
      Get.snackbar("Account is login in another device", "Please login again");
      Get.offAllNamed(loginPage);
    }
    return handler.next(err);
  }
}
