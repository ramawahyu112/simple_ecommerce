import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/cart/presentation/widgets/cart_item.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isBack: true),
      body: SafeArea(
        child: GetBuilder<CartController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(sizeMedium),
                child: Text(
                  "Shopping Cart",
                  style: titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              smallVerticalSpacing(),
              Expanded(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(sizeMedium),
                          child: controller.listCart.isEmpty
                              ? Container(
                                  height: 50.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "No Item Found",
                                    style: titleTextStyle,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.listCart.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    final data = controller.listCart[index];
                                    return CartItem(index: index, data: data);
                                  },
                                ),
                        ),
                      ),
                      Card(
                        // shape: const RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(sizeMedium),
                        //         topRight: Radius.circular(sizeMedium))),
                        child: Padding(
                          padding: const EdgeInsets.all(sizeMedium),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: normalText,
                                  ),
                                  Text(
                                    "\$${controller.cartTotal}",
                                    style: headerTextStyle,
                                  ),
                                ],
                              ),
                              mediumVerticalSpacing(),
                              CustomButton(
                                isRounded: true,
                                color: orangeColor,
                                child: Text(
                                  "Checkout",
                                  style: normalTextStyleButton,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
