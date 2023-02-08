import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasuz_web/components/my_appbar.dart';
import 'package:tasuz_web/screen/about_company_page.dart';
import 'package:tasuz_web/screen/address_page.dart';
import 'package:tasuz_web/screen/first_page.dart';
import 'package:tasuz_web/screen/catalog_page.dart';
import 'package:tasuz_web/screen/news_page.dart';
import 'package:tasuz_web/screen/service_page.dart';

import '../components/responsive.dart';
import '../controller/controller.dart';
import 'credit_page.dart';

Controller _controller = Get.put(Controller());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.8),
        extendBodyBehindAppBar: true,
        // extendBody: true,
        appBar: MyAppBar(),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              controller: _controller.homeController,
              child: Container(
                  child: Column(
                    children: [
                      FirstPage(),
                      CatalogPage(),
                      ServicePage(),
                      NewsPage(),
                      AboutCompanyPage(),
                      AddressPage()
                    ],
                  ),
                ),
            ),
            SingleChildScrollView(
              controller: _controller.homeController,
              child: Container(
                margin: EdgeInsets.only(top: 114),
                // height: height,
                child: CatalogPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 114),
              child: CreditPage(),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 114),
              controller: _controller.homeController,
              child: Container(
                child: ServicePage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 114),
              child: NewsPage(),
            ),
            SingleChildScrollView(
              controller: _controller.homeController,
              child: Container(
                child: AboutCompanyPage(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 114),
              child: AddressPage(),
            ),
          ],
        ),
      ),
    );
  }
}
