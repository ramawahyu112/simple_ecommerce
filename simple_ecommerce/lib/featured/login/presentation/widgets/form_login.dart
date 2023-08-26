import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/custom_textfield.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:simple_ecommerce/featured/login/controller/login_controller.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return
        // Obx(() =>
        Form(
            key: controller.keyLogin,
            child: Column(
              children: [
                largeVerticalSpacing(),
                CustomTextField(
                    labelText: "Email", controller: controller.emailController),
                largeVerticalSpacing(),
                CustomTextField(
                  labelText: "Password",
                  controller: controller.passwordController,
                  isPassword: true,
                ),
                mediumVerticalSpacing(),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {}, child: Text("Forgot Password ?")),
                ),
                largeVerticalSpacing(),
                CustomButton(
                    onPressed: () {
                      if (controller.keyLogin.currentState!.validate()) {
                        controller.loginUser().then((value) {
                          Get.toNamed(mainPage);
                        });
                      }
                    },
                    child: Text(
                      "Login",
                      style: dialogButtonTextStyle,
                    )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account ? "),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Register", style: registerButtonTextStyle),
                    )
                  ],
                ))
              ],
            ))
        // )
        ;
  }
}
