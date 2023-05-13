import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      required this.onTap,
      required this.onItemTap,
      required this.productModel});
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
              productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          mediumVerticalSpacing(),
          Text(
            productModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          mediumVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatCurrency(productModel.price)),
              IconButton(
                onPressed: onTap,
                icon: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: orangeColor),
                    child: Icon(
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
