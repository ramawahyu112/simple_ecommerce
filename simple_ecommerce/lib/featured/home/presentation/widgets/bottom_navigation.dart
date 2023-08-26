import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/static/colors.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final controller = Get.find<HomeController>();
  List<BottomNavigationBarItem> navItem() => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favourite",
        ),
        BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 20,
                backgroundColor: orangeColor,
                child: Icon(
                  Icons.menu,
                  color: primaryColor,
                )),
            label: ""),
        const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: "Shopping bag"),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.indexItem.value,
          items: navItem(),
          onTap: (value) {
            controller.changeIndex(value);
          },
          type: BottomNavigationBarType.fixed,
        ));
  }
}
