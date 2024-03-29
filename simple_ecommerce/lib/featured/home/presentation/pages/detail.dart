import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_alert.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import 'package:sizer/sizer.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
        title: productModel.productName,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sizeMedium),
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            // decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(paddingLarge),
            //         topLeft: Radius.circular(paddingLarge))),
            child: Padding(
              padding: const EdgeInsets.all(sizeSmall),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(
                    //   productModel.productName,
                    //   style: headerTextStyle,
                    // ),
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        productModel.photo,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 8.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: orangeColor,
                              );
                            },
                            itemCount: 5,
                          ),
                          const Text(
                            "125 Reviews",
                            style: startProductTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      formatCurrency(productModel.price),
                      style: productPriceTextStyle,
                    ),
                    smallVerticalSpacing(),
                    Text(
                      productModel.description,
                      style: descriptionProductTextStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: SizedBox(
        height: 5.h,
        width: 90.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () async {
                  await controller
                      .addProductToCart(
                          productModel.id.toString(), productModel.price.toString())
                      .then((value) async {
                    if (value == true) {
                      await controller.getProductCart().then((value) {
                        showDialog(
                            context: context,
                            builder: (context) => const CustomAlert(
                                  title: "Success",
                                  message: "Data saved Successfully",
                                ));
                      });
                    }
                  });
                },
                buttonRadius: 12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.shopping_cart),
                    smallHorizontalSpacing(),
                    Text(
                      "Add to My Cart",
                      style: normalTextStyleButton,
                    )
                  ]),
                ),
              ),
            ),
            mediumHorizontalSpacing(),
            CustomButton(
                width: 15.w,
                onPressed: () {},
                buttonRadius: 12,
                child: const Icon(
                  Icons.favorite_border,
                  color: whiteColor,
                  size: 25,
                )),
            // Container(
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: orangeColor),
            //   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //     const Icon(Icons.shopping_cart),
            //     smallHorizontalSpacing(),
            //     const Text("Add to My Cart")
            //   ]),
            // ),
          ],
        ),
      ),
    );
  }
}
