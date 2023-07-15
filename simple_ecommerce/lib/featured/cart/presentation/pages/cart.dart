import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Scaffold(
      appBar: const CustomAppBar(isBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(paddingLarge),
                        topLeft: Radius.circular(paddingLarge))),
                child: Padding(
                  padding: const EdgeInsets.all(paddingMedium),
                  child: Column(children: [
                    const Text("Eames Chair"),
                    SizedBox(
                      width: Get.width,
                      height: 100,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const Icon(Icons.star);
                              },
                              itemCount: 5,
                            ),
                          ),
                          mediumHorizontalSpacing(),
                          const Text("125 Reviews"),
                          const Expanded(child: Text("280"))
                        ],
                      ),
                    ),
                    smallVerticalSpacing(),
                    const Text("Lorem ipsum"),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: Get.width,
        child: FloatingActionButton(
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.heart_broken,
                color: orangeColor,
              ),
            ),
            mediumHorizontalSpacing(),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20), color: orangeColor),
              child: Padding(
                padding: const EdgeInsets.all(paddingMedium),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.shopping_cart),
                  smallHorizontalSpacing(),
                  const Text("Add to My Cart")
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
