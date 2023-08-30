import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';

import 'package:loader_overlay/loader_overlay.dart';

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
        child: LoaderOverlay(
            overlayColor: orangeColor,
            child: Container(color: orangeColor, child: body)),
      ),
    );
  }
}
