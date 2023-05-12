import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/home.dart';

import 'core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: orangeColor,
          unselectedItemColor: Colors.black, // Warna item terpilih
          showUnselectedLabels:
              true, // Menampilkan label untuk item tidak terpilih
        ),
      ),
      getPages: routes(),
      home: HomePage(),
    );
  }
}
