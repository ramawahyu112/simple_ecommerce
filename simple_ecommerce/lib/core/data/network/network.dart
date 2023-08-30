import 'package:get/get.dart';
import 'package:simple_ecommerce/core/config.dart';

class Network extends GetConnect {
  // final _logger = Logger();

  void changeToken() {
    httpClient.addAuthenticator<Object?>((request) {
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  @override
  void onInit() {
    print("test");
    httpClient.baseUrl = "baseUrl";
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = Duration(seconds: 8);
    changeToken();
    httpClient.addRequestModifier<Object?>((request) {
      print('URL: ${request.url}');
      print('Headers: ${request.headers}');
      print('Body: ${request.method}');
      print('Body: ${request.files}');
      print('Body: ${request.contentLength}');
      print('Body: ${request.files!.fields}');
      print('Body: ${request.files!.files}');
      print('Body: ${request.files!.boundary}');
      return request;
    });
    httpClient.addResponseModifier<Object?>((request, response) {
      print("Status Code: ${response.statusCode}");
      print("Body: ${response.body}");
      print("Headers: ${response.headers}");
      print("Status Text: ${response.statusText}");
      return response;
    });

    super.onInit();
  }
}
