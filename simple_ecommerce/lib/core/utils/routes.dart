import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/home.dart';

String homePage = '/home';

List<GetPage<dynamic>> routes() => [
      GetPage(name: homePage, page: () => const HomePage()),
    ];
