import 'package:get/get.dart';
import 'package:simple_ecommerce/core/data/dio_client.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';

Future<void> injection() async {
  DioClient().onInit();
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<CartController>(() => CartController());
}
