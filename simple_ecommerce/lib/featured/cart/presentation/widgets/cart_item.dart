import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_alert.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/cart/presentation/widgets/quantity_button.dart';

import '../../../../core/static/colors.dart';
import '../../../../core/static/dimens.dart';
import '../../../../core/static/style.dart';
import '../../../../core/utils/helper.dart';
import '../../data/model/cart_model.dart';

class CartItem extends GetView<CartController> {
  CartItem({required this.index, required this.data});
  int index;
  CartModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizeMedium)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: sizeMedium, horizontal: sizeMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Image.network(data.productModel.photo)),
            mediumHorizontalSpacing(),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(data.productModel.productName,
                    style: cartProductTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatCurrency(data.productModel.price),
                        style: cartPriceTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                    IconButton(
                        onPressed: () async {
                          await controller.removeProductFromCart(data.id.toString()).then((value) {
                            if (value) {
                              showDialog(
                                context: context,
                                builder: (context) => const CustomAlert(
                                    title: "Success",
                                    message: "Delete product from cart successfully"),
                              ).then((value) async {
                                await controller.getProductCart();
                              });
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: redColor,
                          size: iconMedium,
                        ))
                  ],
                ),
                QuantityButton(index: index)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
