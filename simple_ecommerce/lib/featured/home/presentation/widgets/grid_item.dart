import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSmall),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(paddingMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://asset.kompas.com/crops/PdKQ8JEec1uH477e64QGdeYVWWI=/28x0:612x389/750x500/data/photo/2021/03/29/6061aaa779b88.png",
            height: 80,
            fit: BoxFit.fill,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Elegant Design"),
                  Text("200"),
                ],
              ),
              IconButton(
                onPressed: onTap,
                icon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: orangeColor),
                    child: Icon(
                      Icons.add,
                      color: whiteColor,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
