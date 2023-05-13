import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/grid_item.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/shimmer.dart';

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
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our Products",
                  style: headerTextStyle,
                ),
                controller.isLoadingCategory.value == false
                    ? SizedBox(
                        height: 80,
                        width: Get.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categoryProduct.length,
                            padding: const EdgeInsets.symmetric(
                              vertical: paddingMedium,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: paddingSmall),
                                  child: Obx(
                                    () => Text(
                                        controller.categoryProduct[index]
                                            .toString()
                                            .toCapital(),
                                        style: TextStyle(
                                            color:
                                                controller.itemSelected.value ==
                                                        index
                                                    ? orangeColor
                                                    : blackColor,
                                            fontSize: textMedium)),
                                  ),
                                ),
                                onTap: () {
                                  controller.changeCategory(index);
                                  index == 0
                                      ? controller.getData()
                                      : controller.getDataByCategory(
                                          controller.categoryProduct[index]);
                                },
                              );
                            }),
                      )
                    : Container(),
                // Obx(
                //   () =>
                Expanded(
                  child: controller.isLoading.value
                      ? const ShimmerWidget()
                      : GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.productModel?.length ?? 0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 250,
                            mainAxisSpacing: paddingMedium,
                            crossAxisSpacing: paddingMedium,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            final model = controller.productModel![index];
                            return GridItem(
                              productModel: model,
                              onItemTap: () {
                                Get.toNamed(productDetailPage,
                                    arguments: model);
                              },
                              onTap: () {},
                            );
                          },
                        ),
                ),
                // )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
