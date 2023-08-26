import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';

class LoginDataSource {
  Future<String> doLogin(Map<String, dynamic> formData) async {
    try {
      final response = await dioConnect.post('api/auth/login', data: formData);
      return response.data['token'];
    } catch (e) {
      rethrow;
    }
  }
}
