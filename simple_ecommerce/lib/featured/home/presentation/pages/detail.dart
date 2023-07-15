import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/app_container.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import 'package:sizer/sizer.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return AppContainer(
      isBack: true,
      withNavigation: false,
      body: SingleChildScrollView(
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
                  Text(
                    productModel.productName,
                    style: headerTextStyle,
                  ),
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
      floatingActionButton: SizedBox(
        width: 85.w,
        child: FloatingActionButton(
          isExtended: true,
          onPressed: () async {
            await controller.addProductToCart(
                productModel.id.toString(), productModel.price.toString());
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: orangeColor),
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
