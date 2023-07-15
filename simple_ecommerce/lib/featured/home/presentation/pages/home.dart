import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/app_container.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/grid_item.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return AppContainer(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
                              padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                              child: Obx(
                                () => Text(controller.categoryProduct[index].name.toCapital(),
                                    style: TextStyle(
                                        color: controller.itemSelected.value == index
                                            ? orangeColor
                                            : blackColor,
                                        fontSize: textMedium)),
                              ),
                            ),
                            onTap: () {
                              controller.changeCategory(index);
                              // index == 0
                              // ?
                              controller.getData(controller.categoryProduct[index].id.toString());
                              // : controller.getDataByCategory(
                              //     controller.categoryProduct[index].id.toString());
                            },
                          );
                        }),
                  )
                : Container(alignment: Alignment.center, child: const Text("No Data founded")),
            // Obx(
            //   () =>
            Expanded(
              child: controller.isLoading.value
                  ? const ShimmerWidget()
                  : controller.productModel!.isNotEmpty
                      ? GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.productModel?.length ?? 0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            // mainAxisExtent: 250,
                            mainAxisSpacing: 5.h,
                            crossAxisSpacing: 3.w,
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.4,
                          ),
                          itemBuilder: (context, index) {
                            final model = controller.productModel![index];
                            return GridItem(
                              productModel: model,
                              onItemTap: () {
                                Get.toNamed(productDetailPage, arguments: model);
                              },
                              onTap: () {},
                            );
                          },
                        )
                      : const Center(child: Text("No Item Found")),
            ),
          ],
        ),
      ),
    );
  }
}
