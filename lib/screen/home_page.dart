import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/components/my_appbar.dart';
import 'package:tasuz_web/screen/about_company_page.dart';
import 'package:tasuz_web/screen/address_page.dart';
import 'package:tasuz_web/screen/first_page.dart';
import 'package:tasuz_web/screen/catalog_page.dart';
import 'package:tasuz_web/screen/news_page.dart';
import 'package:tasuz_web/screen/service_page.dart';
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
              child: Column(
                children: const [
                  FirstPage(),
                  CatalogPage(),
                  ServicePage(),
                  NewsPage(),
                  AboutCompanyPage(),
                  AddressPage()
                ],
              ),
            ),
            SingleChildScrollView(
              controller: _controller.homeController,
              child: Padding(
                padding: const EdgeInsets.only(top: 114),
                // height: height,
                child: const CatalogPage(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 114),
              child: CreditPage(),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 114),
              controller: _controller.homeController,
              child: const ServicePage(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 114),
              child: NewsPage(),
            ),
            SingleChildScrollView(
              controller: _controller.homeController,
              child: const AboutCompanyPage(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 114),
              child: AddressPage(),
            ),
          ],
        ),
      ),
    );
  }
}
