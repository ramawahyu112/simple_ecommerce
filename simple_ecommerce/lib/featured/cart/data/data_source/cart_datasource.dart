import 'package:dio/dio.dart' hide FormData;
import '../../../../core/config.dart';

class CartDataSource {
  late Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      headers: {'Authorization': "Bearer 1|3hlTJus7wptj9kPuHiJq4g2P5imRbVEe6O5z0bn1"}));
  Future<dynamic> addToCart(Map<String, dynamic> data) async {
    try {
      final response = await dio.post("api/cart/addCart", data: data);
      print(response.data['message']);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
