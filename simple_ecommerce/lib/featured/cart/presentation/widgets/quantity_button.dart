import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';

class QuantityButton extends GetView<CartController> {
  const QuantityButton({super.key, required this.index});
  final int index;

  void updateCart() async {
    final result = await controller.updateProductCart(index);
    if (result) {
      await controller.getProductCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                controller.decrement(index);
                updateCart();
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
                updateCart();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
