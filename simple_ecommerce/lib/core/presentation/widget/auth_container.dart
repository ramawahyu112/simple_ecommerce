import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';

import '../../../featured/home/presentation/widgets/bottom_navigation.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
    required this.body,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: orangeColor, child: body),
      ),
    );
  }
}
