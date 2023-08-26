import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class CartResponseModel {
  CartResponseModel(
      {required this.message, required this.item, required this.total, required this.data});
  String message;
  int item;
  dynamic total;
  RxList<CartModel> data;

  factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
      message: json["message"],
      item: json["item"],
      total: json["total"],
      data: RxList<CartModel>.from(json["data"].map((x) => CartModel.fromJson(x))));
}

class CartModel {
  CartModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    required this.subtotal,
  });
  int id;
  ProductModel productModel;
  int quantity;
  dynamic subtotal;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json["id"],
      productModel: ProductModel.fromJson(json["product"]),
      quantity: json["quantity"],
      subtotal: json["subtotal"]);
}
