import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/config.dart';
import 'package:simple_ecommerce/featured/home/data/model/category_model.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class ProductDataSource {
  late Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl, contentType: 'application/json', headers: {'Authorization': token}));
  Future<ProductResponseModel?> getDataProduct(String category) async {
    try {
      final response = await dio.get("api/product/?category=$category");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

// 1|MrbN63QeKBX0PNbqu4Ez9mGPnGwwZhfopyJ9LFAP
  Future<ProductResponseModel?> getDataProductByCategory(String category) async {
    try {
      final response = await dio.get("api/product/category/$category");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CategoryResponseModel> getCategory() async {
    try {
      final response = await dio.get("api/category");
      return CategoryResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
