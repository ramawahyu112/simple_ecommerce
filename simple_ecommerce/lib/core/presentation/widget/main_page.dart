import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';

import '../../../featured/home/controller/home_controller.dart';
import '../../../featured/home/presentation/pages/home.dart';
import '../../../featured/home/presentation/widgets/bottom_navigation.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingMedium,
            vertical: paddingMedium,
          ),
          child: Obx(() => _pages[controller.indexItem.value]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
