import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.isBack = false, this.isShoppingCart = true});
  final bool isBack;
  final bool isShoppingCart;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(5.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: widget.isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: blackColor,
              ))
          : null,
      toolbarHeight: 5.h,
      actions: [
        Visibility(
          visible: widget.isShoppingCart,
          child: Padding(
            padding: const EdgeInsets.only(right: paddingMedium),
            child: IconButton(
                color: blackColor,
                onPressed: () {
                  Get.toNamed(cartPage);
                },
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: blackColor,
                      size: 3.5.h,
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 1.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: orangeColor,
                          ),
                          child: Obx(() => Text(controller.cartItem.value.toString())),
                        ))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
