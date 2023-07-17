import 'package:dio/dio.dart' hide FormData;
import 'package:simple_ecommerce/featured/cart/data/model/cart_model.dart';
import '../../../../core/config.dart';

class CartDataSource {
  late Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl, contentType: 'application/json', headers: {'Authorization': token}));

  Future<CartResponseModel> getCart() async {
    try {
      final response = await dio.get("api/cart");
      return CartResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addToCart(Map<String, dynamic> data) async {
    try {
      final response = await dio.post("api/cart/addCart", data: data);
      print(response.data['message']);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeCart(String id) async {
    try {
      final response = await dio.get("api/cart/delete/$id");
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
