import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/utils/session_helper.dart';
import 'package:simple_ecommerce/featured/login/controller/state/login_state.dart';
import 'package:simple_ecommerce/featured/login/data/data_source/login_datasource.dart';

class LoginController extends GetxController {
  LoginDataSource dataSource = LoginDataSource();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyLogin = GlobalKey<FormState>();

  Future<LoginState> loginUser() async {
    final formData =
        ({'username': usernameController.text, 'password': passwordController.text});
    try {
      final result = await dataSource.doLogin(formData);
      if (result.message == 'success') {
        final token = await Session().setToken(result.token.toString());
        printInfo(info: "Token status : $token with $result");
        return LoginSuccess(data: result);
      }
      return LoginFailed(msg: result.message);
    } catch (e) {
      printError(info: e.toString());
      return LoginFailed(msg: e.toString());
    }
  }

  void clearState() {
    usernameController.clear();
    passwordController.clear();
    keyLogin = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("this close");
    super.onClose();
  }
}
