import 'package:get/get.dart';

class HomeController extends GetxController {
  final indexItem = 0.obs;
  final cartItem = 0.obs;
  final itemSelected = 0.obs;

  List<String> listCategory =
      ['All', 'Shoes', 'T-shirt', 'Jeans', 'Hoodie', 'Accecories'].obs;

  void changeIndex(val) {
    indexItem.value = val;
  }

  void changeCategory(val) {
    itemSelected.value = val;
  }
}
