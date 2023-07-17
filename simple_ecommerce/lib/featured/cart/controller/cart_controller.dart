import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/cart/data/data_source/cart_datasource.dart';
import 'package:simple_ecommerce/featured/cart/data/model/cart_model.dart';

class CartController extends GetxController {
  var cartItem = 0.obs;
  RxList<CartModel> listCart = <CartModel>[].obs;
  CartDataSource dataSource = CartDataSource();
  Future<bool> getProductCart() async {
    try {
      final result = await dataSource.getCart();
      listCart.value = result.data;
      cartItem.value = result.item;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addProductToCart(String productId, String subTotal, {String quantity = "1"}) async {
    try {
      final data = {
        "product_id": productId,
        "quantity": quantity,
        "subtotal": subTotal,
      };
      final result = await dataSource.addToCart(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeProductFromCart(String productId) async {
    try {
      final result = await dataSource.removeCart(productId);
      return result;
    } catch (e) {
      return false;
    }
  }

  void increment(int index) {
    listCart[index].quantity += 1;
    listCart.refresh();
  }

  void decrement(int index) {
    if (listCart[index].quantity.isGreaterThan(0)) {
      listCart[index].quantity -= 1;
    }
    listCart.refresh();
  }

  @override
  void onInit() {
    getProductCart();
    super.onInit();
  }
}
