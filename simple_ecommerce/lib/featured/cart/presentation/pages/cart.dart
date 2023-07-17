import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/app_container.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/cart/presentation/widgets/cart_item.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      isBack: true,
      isShoppingCart: false,
      withNavigation: false,
      body: SingleChildScrollView(
        child: GetBuilder<CartController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shopping Cart",
                style: titleTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              smallVerticalSpacing(),
              Obx(
                () => controller.listCart.isEmpty
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
                        itemBuilder: (context, index) {
                          final data = controller.listCart[index];
                          return CartItem(index: index, data: data);
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
