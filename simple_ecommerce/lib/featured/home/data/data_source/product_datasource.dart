import 'package:simple_ecommerce/featured/home/data/model/category_model.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import '../../../../core/utils/helper.dart';

class ProductDataSource {
  Future<ProductResponseModel?> getDataProduct(String category) async {
    try {
      final response = await dioConnect.get("api/product/?category=$category");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductResponseModel?> getDataProductByCategory(String category) async {
    try {
      final response = await dioConnect.get("api/product/category/$category");
      return ProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CategoryResponseModel> getCategory() async {
    try {
      final response = await dioConnect.get("api/category");
      return CategoryResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
