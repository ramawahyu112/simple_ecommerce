import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';

import '../../../featured/home/controller/home_controller.dart';
import '../../../featured/home/presentation/pages/home.dart';
import '../../../featured/home/presentation/widgets/bottom_navigation.dart';
import '../../../featured/login/presentation/pages/login_page.dart';

class MainPage extends StatelessWidget {
  List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
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
