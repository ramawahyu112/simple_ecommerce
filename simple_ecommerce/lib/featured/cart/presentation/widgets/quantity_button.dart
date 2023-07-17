import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';

import '../../../../core/static/colors.dart';
import '../../../../core/static/style.dart';

class QuantityButton extends GetView<CartController> {
  QuantityButton({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                controller.decrement(index);
              },
              icon: const Icon(Icons.remove)),
          Expanded(
            child: Card(
              color: orangeColor,
              child: Obx(
                () => Text(
                  "${controller.listCart[index].quantity}",
                  textAlign: TextAlign.center,
                  style: counterTextStyle,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                controller.increment(index);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
