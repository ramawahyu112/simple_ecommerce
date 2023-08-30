import 'package:get/get.dart';
import 'package:simple_ecommerce/core/utils/session_helper.dart';
import 'package:simple_ecommerce/featured/cart/controller/cart_controller.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';

import '../data/network/dio_client.dart';

Future<void> injection() async {
  await Get.putAsync(() => DioClient().init());
  await Get.putAsync(() => Session().initialize());
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<CartController>(() => CartController());
}

// class BindingExample extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => TestProvider());
//   }
// }
