import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/custom_textfield.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_alert.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:simple_ecommerce/core/utils/form_validator.dart';
import 'package:simple_ecommerce/featured/register/controller/register_controller.dart';
import 'package:simple_ecommerce/featured/register/controller/state/register_state.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return
        // Obx(() =>
        Form(
            key: controller.keyRegister,
            child: Column(
              children: [
                largeVerticalSpacing(),
                CustomTextField(
                    labelText: "Username",
                    controller: controller.usernameController,
                    type: TextType.none),
                largeVerticalSpacing(),
                CustomTextField(
                    labelText: "Name",
                    controller: controller.nameController,
                    type: TextType.none),
                largeVerticalSpacing(),
                CustomTextField(
                    labelText: "Email",
                    controller: controller.emailController,
                    type: TextType.email),
                largeVerticalSpacing(),
                CustomTextField(
                  labelText: "Password",
                  controller: controller.passwordController,
                  isPassword: true,
                  type: TextType.password,
                ),
                largeVerticalSpacing(),
                CustomButton(
                    onPressed: () {
                      if (controller.keyRegister.currentState!.validate()) {
                        controller.registerUser().listen((state) {
                          final loader = context.loaderOverlay;
                          if (state is RegisterLoading) {
                            loader.show();
                          } else if (state is RegisterSuccess) {
                            loader.hide();

                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlert(
                                  title: "Register Success",
                                  message: "Click OK to Back Login",
                                  action: [
                                    SingleButtonDialog(
                                      buttonColor: greenColor,
                                      buttonText: "OK",
                                      onOk: () {
                                        controller.clearState();
                                        Get.offAndToNamed(loginPage);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          } else if (state is RegisterFailed) {
                            loader.hide();
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
                      "Register",
                      style: dialogButtonTextStyle,
                    )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ? ",
                      style: normalText,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.clearState();
                        Get.offAndToNamed(loginPage);
                      },
                      child: Text("Login", style: registerButtonTextStyle),
                    )
                  ],
                ))
              ],
            ))
        // )
        ;
  }
}
