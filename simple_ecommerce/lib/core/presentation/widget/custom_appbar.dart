import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/static/colors.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.isBack = false, this.isShoppingCart = true});
  final bool isBack;
  final bool isShoppingCart;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final controller = Get.find<HomeController>();
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
              icon: Icon(
                Icons.arrow_back_ios,
                color: blackColor,
              ))
          : null,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: blackColor,
                ),
                Positioned(
                    right: 0,
                    top: -2,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: orangeColor),
                          color: orangeColor),
                      child:
                          Obx(() => Text(controller.cartItem.value.toString())),
                    ))
              ],
            )),
      ],
    );
  }
}
