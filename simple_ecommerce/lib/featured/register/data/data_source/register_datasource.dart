import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';

class RegisterDataSource {
  Future<String> doRegister(Map<String, dynamic> formData) async {
    try {
      final response = await dioConnect.post('api/auth/register', data: formData);
      return response.data['message'];
    } catch (e) {
      printError(info: "Register Failed: $e");
      throw Exception(e.toString());
    }
  }
}
