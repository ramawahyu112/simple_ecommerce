import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/register/controller/state/register_state.dart';
import 'package:simple_ecommerce/featured/register/data/data_source/register_datasource.dart';

class RegisterController extends GetxController {
  RegisterDataSource dataSource = RegisterDataSource();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyRegister = GlobalKey<FormState>();

  Stream<RegisterState> registerUser() async* {
    yield RegisterLoading();
    final formData = ({
      'email': emailController.text,
      'password': passwordController.text,
      'name': nameController.text,
      'username': usernameController.text
    });
    try {
      final result = await dataSource.doRegister(formData);
      if (result == 'success') {
        yield RegisterSuccess(msg: result);
      } else {
        yield RegisterFailed(msg: result);
      }
    } catch (e) {
      printError(info: e.toString());
      yield RegisterFailed(msg: e.toString());
    }
  }

  void clearState() {
    usernameController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    keyRegister = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    printInfo(info: "register controller close");
    super.onClose();
  }
}
