import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/controller/home_controller.dart';

Future<void> injection() async {
  Get.lazyPut<HomeController>(() => HomeController());
}
