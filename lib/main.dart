import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tasuz_web/screen/about_company_page.dart';
import 'package:tasuz_web/screen/address_page.dart';
import 'package:tasuz_web/screen/test.dart';
import 'package:tasuz_web/screen/catalog_page.dart';
import 'package:tasuz_web/screen/first_page.dart';
import 'package:tasuz_web/screen/home_page.dart';
import 'package:tasuz_web/screen/news_page.dart';
import 'package:tasuz_web/screen/service_page.dart';
import 'package:tasuz_web/screen/catalog_select_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Oswald",
        useMaterial3: true
      ),
      home: HomePage(),
      // getPages: [
      //   GetPage(name: '/', page: () => HomePage()),
      //   GetPage(name: '/first_page', page: () => FirstPage()),
      //   GetPage(name: '/catalog_page', page: () => CatalogPage()),
      //   GetPage(name: '/catalog_select_page', page: () => CatalogSelectPage(),),
      //   // GetPage(name: '/credit_page', page: () => CreditPage()),
      //   GetPage(name: '/catalog_inside', page: () => CatalogInside()),
      //   GetPage(name: '/service_page', page: () => ServicePage()),
      //   GetPage(name: '/news_page', page: () => NewsPage()),
      //   GetPage(name: '/about_company_page', page: () => AboutCompanyPage()),
      //   GetPage(name: '/address_page', page: () => AddressPage()),
      // ],
    );
  }
}


