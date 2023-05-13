import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/config.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class ProductDataSource {
  late Dio dio = Dio();

  Future<ProductResponseModel?> getDataProduct() async {
    try {
      final response = await dio.get(baseUrl + "/products");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductResponseModel?> getDataProductByCategory(
      String category) async {
    try {
      final response =
          await dio.get(baseUrl + "/products/category/${category}");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getCategory() async {
    try {
      final response = await dio.get(baseUrl + "/products/categories");
      print(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
