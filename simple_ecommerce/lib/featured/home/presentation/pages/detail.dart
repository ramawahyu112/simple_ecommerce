import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(paddingLarge),
                    topLeft: Radius.circular(paddingLarge))),
            child: Padding(
              padding: const EdgeInsets.all(paddingMedium),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title,
                      style: headerTextStyle,
                    ),
                    mediumVerticalSpacing(),
                    Image.network(
                      productModel.image,
                      height: 300,
                      width: 300,
                    ),
                    mediumVerticalSpacing(),
                    SizedBox(
                      width: Get.width,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: orangeColor,
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                          Text(
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
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: Get.width - 30,
        child: FloatingActionButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: orangeColor),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.shopping_cart),
              smallHorizontalSpacing(),
              const Text("Add to My Cart")
            ]),
          ),
        ),
      ),
    );
  }
}
