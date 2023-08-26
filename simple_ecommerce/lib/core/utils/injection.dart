import 'package:get/get.dart';
import 'package:simple_ecommerce/core/data/dio_client.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';
import 'package:simple_ecommerce/featured/login/controller/login_controller.dart';

Future<void> injection() async {
  await Get.putAsync(() => DioClient().init());
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<CartController>(() => CartController());
  Get.lazyPut<LoginController>(() => LoginController());
}

// class BindingExample extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => TestProvider());
//   }
// }
