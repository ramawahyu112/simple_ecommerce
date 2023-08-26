import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/grid_item.dart';
import 'package:simple_ecommerce/featured/home/presentation/widgets/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(1.w, 2.h),
                              ),
                              onPressed: () {
                                controller.changeCategory(index);
                                // index == 0
                                // ?
                                controller.getData(
                                    controller.categoryProduct[index].id.toString());
                                // : controller.getDataByCategory(
                                //     controller.categoryProduct[index].id.toString());
                              },
                              child: Obx(
                                () => Text(
                                    controller.categoryProduct[index].name
                                        .toCapital(),
                                    style: TextStyle(
                                        color: controller.itemSelected.value == index
                                            ? orangeColor
                                            : blackColor,
                                        fontSize: textMedium)),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : Container(
                  alignment: Alignment.center, child: const Text("No Data founded")),
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
                    : Center(
                        child: Text(
                        "No Item Found",
                        style: titleTextStyle,
                      )),
          ),
        ],
      ),
    );
  }
}
