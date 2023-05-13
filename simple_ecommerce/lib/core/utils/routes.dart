import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/detail.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/home.dart';

String homePage = '/home';
String productDetailPage = '/productDetail';

List<GetPage<dynamic>> routes() => [
      GetPage(name: homePage, page: () => const HomePage()),
      GetPage(
          name: productDetailPage,
          page: () {
            final args = Get.arguments as ProductModel;
            return ProductDetailPage(
              productModel: args,
            );
          }),
    ];
