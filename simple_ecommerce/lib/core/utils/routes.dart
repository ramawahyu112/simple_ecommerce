import 'package:get/get.dart';
import 'package:simple_ecommerce/core/presentation/widget/main_page.dart';
import 'package:simple_ecommerce/featured/cart/data/model/cart_model.dart';
import 'package:simple_ecommerce/featured/cart/presentation/pages/cart.dart';
import 'package:simple_ecommerce/featured/home/data/model/product_model.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/detail.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/home.dart';
import 'package:simple_ecommerce/featured/login/presentation/pages/login_page.dart';

String loginPage = '/loginPage';
String mainPage = '/mainPage';
String productDetailPage = '/productDetail';
String cartPage = '/cartPage';

List<GetPage<dynamic>> routes() => [
      GetPage(name: loginPage, page: () => const LoginPage()),
      GetPage(name: mainPage, page: () => MainPage()),
      GetPage(
          name: productDetailPage,
          page: () {
            final args = Get.arguments as ProductModel;
            return ProductDetailPage(
              productModel: args,
            );
          }),
      GetPage(
          name: cartPage,
          page: () {
            return CartPage();
          }),
    ];
