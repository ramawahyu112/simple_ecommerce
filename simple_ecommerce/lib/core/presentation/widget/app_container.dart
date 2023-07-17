import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';

import '../../../featured/home/presentation/widgets/bottom_navigation.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {super.key,
      this.isBack = false,
      this.isShoppingCart = true,
      this.withNavigation = true,
      required this.body,
      this.floatingActionButton,
      this.buttonPosition});
  final bool isBack;
  final bool isShoppingCart;
  final bool withNavigation;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? buttonPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBack: isBack, isShoppingCart: isShoppingCart),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingMedium,
          ),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: buttonPosition ?? FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: withNavigation ? const BottomNavigation() : null,
    );
  }
}
