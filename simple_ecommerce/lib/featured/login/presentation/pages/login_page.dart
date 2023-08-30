import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/auth_container.dart';
import 'package:simple_ecommerce/featured/login/presentation/widgets/form_login.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: 15.h,
            child: Text("LOGIN",
                textAlign: TextAlign.center, style: loginTitleTextStyle),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(sizeLarge),
                      topRight: Radius.circular(sizeLarge))),
              child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeMedium, horizontal: sizeLarge),
                  child: FormLogin()),
            ),
          ),
        ],
      ),
    );
  }
}
