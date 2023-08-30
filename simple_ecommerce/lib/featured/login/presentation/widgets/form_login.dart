import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/custom_textfield.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_alert.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:simple_ecommerce/core/utils/form_validator.dart';
import 'package:simple_ecommerce/featured/login/controller/login_controller.dart';
import 'package:simple_ecommerce/featured/login/controller/state/login_state.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return
        // Obx(() =>
        Form(
            key: controller.keyLogin,
            child: Column(
              children: [
                largeVerticalSpacing(),
                CustomTextField(
                    labelText: "Username",
                    controller: controller.usernameController,
                    type: TextType.none),
                largeVerticalSpacing(),
                CustomTextField(
                  labelText: "Password",
                  controller: controller.passwordController,
                  isPassword: true,
                  type: TextType.password,
                ),
                mediumVerticalSpacing(),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: normalText,
                      )),
                ),
                largeVerticalSpacing(),
                CustomButton(
                    onPressed: () {
                      if (controller.keyLogin.currentState!.validate()) {
                        controller.loginUser().then((state) {
                          if (state is LoginSuccess) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlert(
                                  title: "Login Success",
                                  message: "Click OK to Continue",
                                  action: [
                                    SingleButtonDialog(
                                      buttonColor: greenColor,
                                      buttonText: "OK",
                                      onOk: () {
                                        controller.clearState();
                                        Get.offAllNamed(mainPage);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          } else if (state is LoginFailed) {
                            final msg = state.msg;
                            Get.snackbar(
                              "Error",
                              msg.toString(),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: orangeColor,
                            );
                          }
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
                    const Text(
                      "Dont have an account ? ",
                      style: normalText,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.clearState();
                        Get.toNamed(registerPage);
                      },
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
