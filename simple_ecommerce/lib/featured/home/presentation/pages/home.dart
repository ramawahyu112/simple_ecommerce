import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/grid_item.dart';

import '../widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingMedium),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our Products",
                  style: headerTextStyle,
                ),
                SizedBox(
                  height: 80,
                  width: Get.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listCategory.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: paddingMedium,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: paddingSmall),
                              child: Text(controller.listCategory[index],
                                  style: TextStyle(
                                      color:
                                          controller.itemSelected.value == index
                                              ? orangeColor
                                              : blackColor,
                                      fontSize: textMedium)),
                            ),
                          ),
                          onTap: () {
                            controller.changeCategory(index);
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: Get.height,
                  child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return GridItem(
                        onTap: () {},
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
