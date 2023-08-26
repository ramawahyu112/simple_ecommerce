import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/data/data_source/product_datasource.dart';
import 'package:simple_ecommerce/featured/home/data/model/category_model.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';

class HomeController extends GetxController {
  ProductDataSource productDataSource = ProductDataSource();
  List<ProductModel>? productModel = <ProductModel>[].obs;
  List<CategoryModel> categoryProduct = <CategoryModel>[].obs;
  final indexItem = 0.obs;
  final cartItem = 0.obs;
  final itemSelected = 0.obs;
  final isLoading = true.obs;
  final isLoadingCategory = true.obs;

  void changeIndex(val) {
    indexItem.value = val;
  }

  void changeCategory(val) {
    itemSelected.value = val;
  }

  void setLoading(val) {
    isLoading.value = val;
  }

  void setLoadingCategory(val) {
    isLoadingCategory.value = val;
  }

  Future<void> getData(String category) async {
    setLoading(true);
    try {
      final result = await productDataSource.getDataProduct(category);
      productModel = result!.listProduct;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }

  Future<void> getDataByCategory(String category) async {
    setLoading(true);
    try {
      final result = await productDataSource.getDataProductByCategory(category);
      productModel = result!.listProduct;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }

  Future<void> getCategory() async {
    setLoadingCategory(true);
    try {
      final result = await productDataSource.getCategory();
      categoryProduct = result.listCategory;
      categoryProduct.insert(0, CategoryModel(id: 0, name: "All"));
      setLoadingCategory(false);
      //Add category all
    } catch (e) {
      setLoadingCategory(false);
      rethrow;
    }
  }

  @override
  void onInit() {
    getCategory();
    getData("0");
    super.onInit();
  }
}
