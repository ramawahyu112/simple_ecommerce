import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/cart/data/data_source/cart_datasource.dart';

class CartController extends GetxController {
  final cartItem = 0.obs;
  CartDataSource dataSource = CartDataSource();
  Future<bool> addProductToCart(String productId, String subTotal, {String quantity = "1"}) async {
    try {
      final data = {
        "product_id": productId,
        "quantity": quantity,
        "subtotal": subTotal,
      };
      final result = dataSource.addToCart(data);
      return true;
    } catch (e) {
      print("err : $e");
      return false;
    }
  }
}
