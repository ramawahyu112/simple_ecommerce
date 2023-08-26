import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/login/data/data_source/login_datasource.dart';

class LoginController extends GetxController {
  LoginDataSource dataSource = LoginDataSource();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyLogin = GlobalKey<FormState>();

  Future<String> loginUser() async {
    final formData =
        ({'email': emailController.text, 'password': passwordController.text});
    try {
      final result = await dataSource.doLogin(formData);
      return result;
    } catch (e) {
      print("err: $e");
      rethrow;
    }
  }
}
