import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_ecommerce/core/config.dart';

import '../utils/helper.dart';

class DioClient extends GetxService {
  // @override
  Future<DioClient> init() async {
    dioConnect = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-type': 'application/json', 'Authorization': token}));
    initInterceptor();
    return this;
    // super.onInit();
  }

  void initInterceptor() {
    dioConnect.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
}
