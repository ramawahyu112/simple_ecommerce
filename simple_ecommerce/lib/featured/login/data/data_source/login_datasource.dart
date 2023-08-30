import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/login/data/model/login_model.dart';

class LoginDataSource {
  Future<LoginModel> doLogin(Map<String, dynamic> formData) async {
    try {
      final response = await dioConnect.post('api/auth/login', data: formData);
      return LoginModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        throw Exception(e.response!.data['message'].toString().capitalize);
      }
      printError(info: "Login Failed: $e");
      throw Exception(e.toString());
    }
  }
}
