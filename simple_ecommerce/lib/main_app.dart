import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/featured/home/presentation/pages/home.dart';
import 'package:simple_ecommerce/featured/login/presentation/pages/login_page.dart';
import 'package:sizer/sizer.dart';

import 'core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: orangeColor,
            unselectedItemColor: Colors.black, // Warna item terpilih
            showUnselectedLabels:
                true, // Menampilkan label untuk item tidak terpilih
          ),
        ),
        getPages: routes(),
        home: const LoginPage(),
      ),
    );
  }
}
