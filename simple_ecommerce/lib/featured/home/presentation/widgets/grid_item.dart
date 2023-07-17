import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_alert.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import 'package:sizer/sizer.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key, required this.onTap, required this.onItemTap, required this.productModel});
  final Function() onTap;
  final Function() onItemTap;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              productModel.photo,
              fit: BoxFit.fill,
            ),
          ),
          mediumVerticalSpacing(),
          Text(
            productModel.productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          mediumVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatCurrency(productModel.price), style: productPriceTextStyle),
              IconButton(
                onPressed: () {},
                icon: Container(
                    width: 10.w,
                    height: 4.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), color: orangeColor),
                    child: const Icon(
                      Icons.add,
                      color: whiteColor,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
