import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:tasuz_web/screen/about_company_page.dart';
import 'package:tasuz_web/screen/address_page.dart';
import 'package:tasuz_web/screen/catalog_page.dart';
import 'package:tasuz_web/screen/catalog_select_page.dart';
import 'package:tasuz_web/screen/first_page.dart';
import 'package:tasuz_web/screen/home_page.dart';
import 'package:tasuz_web/screen/news_page.dart';
import 'package:tasuz_web/screen/service_page.dart';

import 'generated/l10n.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))
      ),
        debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      locale: const Locale('ru', 'RU'),
      theme: ThemeData(fontFamily: "Oswald", useMaterial3: true),
      // home: HomePage(),
      // initialRoute: '/',
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      getPages: [
          GetPage(name: '/', page: () => HomePage()),
      //     GetPage(name: '/first_page', page: () => FirstPage()),
      //     GetPage(name: '/catalog_page', page: () => CatalogPage()),
          GetPage(name: '/catalog_select_page', page: () => CatalogSelectPage(),),
      //     // GetPage(name: '/credit_page', page: () => CreditPage()),
          GetPage(name: "/service_page", page: () => ServicePage()),
      //     GetPage(name: '/news_page', page: () => NewsPage()),
      //     GetPage(name: '/about_company_page', page: () => AboutCompanyPage()),
      //     GetPage(name: '/address_page', page: () => AddressPage()),
      ],
    );
  }
}

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: "/",
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <GoRoute>[
        GoRoute(
          path: 'catalog_select_page',
          builder: (BuildContext context, GoRouterState state) {
            return CatalogSelectPage();
          },
        ),
        GoRoute(
          path: 'service_page',
          builder: (BuildContext context, GoRouterState state) {
            return ServicePage();
          },
        ),
      ],
    ),
  ],
);






