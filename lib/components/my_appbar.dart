import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/components/responsive.dart';
import 'package:tasuz_web/controller/controller.dart';

List<String> titles = <String>[
  'Главное',
  'Каталоги',
  'Партнеры',
  'Сервис',
  'Новости',
  'О компании',
  'Адреса',
];

List<String> titles2 = <String>[
  'Bosh',
  'Kataloglar',
  'Hamkorlar',
  'Servis',
  'Yangiliklar',
  'Kompaniya haqida',
  'Manzil',
];

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize {
    return const Size(double.infinity, 115);
  }
}

class _MyAppBarState extends State<MyAppBar> {
  // bool _changeLocal = false;
  bool isAppbarCollapsing = false;
  final Controller _controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    // for adding appbar background color change effect
    // when scrolled
    _initializeController();
  }

  @override
  void dispose() {
    _controller.homeController.dispose();
    super.dispose();
  }

  void _initializeController() {
    _controller.homeController.addListener(() {
      if (_controller.homeController.offset == 0.0 &&
          !_controller.homeController.position.outOfRange) {
        //Fully expanded situation
        if (!mounted) return;
        setState(() => isAppbarCollapsing = false);
      }
      if (_controller.homeController.offset >= 2.0 &&
          !_controller.homeController.position.outOfRange) {
        //Collapsing situation
        if (!mounted) return;
        setState(() => isAppbarCollapsing = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.amberAccent,
      backgroundColor:
          isAppbarCollapsing ? Colors.yellow.shade400 : Colors.transparent,
      leadingWidth: 100,
      leading: Container(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
        child: Image.asset(
          'assets/images/logoTasorigin.png',
          color: isAppbarCollapsing ?Colors.black :Colors.yellow,
          fit: BoxFit.fill,
        ),
      ),
      title: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: !isMobile(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Text(
              _controller.changeLocal.isFalse
                  ? "Xitoydan O‘zbekistonga maxsus texnika, \nuskunalar va ehtiyot qismlar yetkazib berish."
                  : "Поставки спецтехники, оборудования \nи запчастей из Китая в Узбекистан ",
              textAlign: isMobile(context) ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontSize: 13,
                color: isAppbarCollapsing ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
      titleSpacing: 0,
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 1;
      },
      centerTitle: false,
      actions: [
        TextButton.icon(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: isMobile(context) ? 10 : 20)),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return isAppbarCollapsing
                    ? Colors.white
                    : Colors.yellow.shade400;
              }
              return isAppbarCollapsing ? Colors.black : Colors.white;
            }),
          ),
          onPressed: () {
            // handle the press
          },
          icon: const Icon(Icons.call),
          label: const Text("+998 78 147 00 80"),
        ),
        SizedBox(
          width: 30,
        ),
        InkWell(
          radius: 20,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              // _changeLocal = !_changeLocal;
              _controller.changeLocale();
            });
          },
          child: Center(
            child: Obx(() => Text(
                  _controller.changeLocal.isFalse ? 'UZ' : 'RU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: isAppbarCollapsing ? Colors.blue : Colors.yellow),
                )),
          ),
        ),
        SizedBox(
          width: 30,
        ),
      ],
      bottom: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: isAppbarCollapsing
            ? Colors.lightBlueAccent
            : Colors.yellow.shade400,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4.0,
        labelColor: isAppbarCollapsing
            ? Colors.lightBlueAccent
            : Colors.yellow.shade400,
        unselectedLabelColor:
            isAppbarCollapsing ? Colors.black : Colors.white70,
        tabs: <Widget>[
          Tab(
            icon: const Icon(Icons.home),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[0]
                    : titles[0]
                : null,
          ),
          Tab(
            icon: const Icon(Typicons.th_large_outline),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[1]
                    : titles[1]
                : null,
          ),
          Tab(
            icon: const Icon(FontAwesome5.people_arrows),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[2]
                    : titles[2]
                : null,
          ),
          Tab(
            icon: const Icon(Icons.car_repair),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[3]
                    : titles[3]
                : null,
          ),
          Tab(
            icon: const Icon(Typicons.news),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[4]
                    : titles[4]
                : null,
          ),
          Tab(
            icon: const Icon(CupertinoIcons.building_2_fill),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[5]
                    : titles[5]
                : null,
          ),
          Tab(
            icon: const Icon(CupertinoIcons.map_pin_ellipse),
            text: !isMobile(context)
                ? _controller.changeLocal.isFalse
                    ? titles2[6]
                    : titles[6]
                : null,
          ),
        ],
      ),
    );

    //   Scaffold(
    //   appBar: AppBar(
    //     leading: Image.asset("/assets/logo-white"),
    //     leadingWidth: 100,
    //   ),
    // );
  }
}
