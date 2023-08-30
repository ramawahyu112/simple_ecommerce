import 'package:dio/dio.dart' hide FormData;
import 'package:simple_ecommerce/featured/cart/data/model/cart_model.dart';
import '../../../../core/utils/helper.dart';

class CartDataSource {
  Future<CartResponseModel> getCart() async {
    try {
      final response = await dioConnect.get("api/cart");
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addToCart(Map<String, dynamic> data) async {
    try {
      final response = await dioConnect.post("api/cart/addCart", data: data);
      print(response.data['message']);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateCart(Map<String, dynamic> data, int id) async {
    try {
      final response = await dioConnect.post("api/cart/updateCart/$id", data: data);
      print(response.data['message']);
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeCart(String id) async {
    try {
      final response = await dioConnect.get("api/cart/delete/$id");
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
