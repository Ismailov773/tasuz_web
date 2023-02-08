import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasuz_web/components/responsive.dart';
import 'package:tasuz_web/controller/controller.dart';

List<String> titles = <String>[
  'Главное',
  'Каталоги',
  'Кредит',
  'Сервис',
  'Новости',
  'О компании',
  'Адреса',
];

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize {
    return Size(double.infinity, 115);
  }
}

class _MyAppBarState extends State<MyAppBar> {
  bool isAppbarCollapsing = false;
  Controller _controller = Get.put(Controller());

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
      leadingWidth: 150,
      leading: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 5),
        child: Image.asset(
          'assets/images/tss.png',
          width: MediaQuery.of(context).size.width / 2,
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
                "Поставки спецтехники, оборудования ",
                textAlign:
                    isMobile(context) ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  color: isAppbarCollapsing ? Colors.black : Colors.white,
                ),
              ),
              Text(
                "и запчастей из Китая в Узбекистан",
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
              if (states.contains(MaterialState.hovered))
                return isAppbarCollapsing
                    ? Colors.white
                    : Colors.yellow.shade400;
              return isAppbarCollapsing ? Colors.black : Colors.white;
            }),
          ),
          onPressed: () {
            // handle the press
          },
          icon: Icon(Icons.call),
          label: Text("+998 78 147 00 80"),
        ),
      ],
      bottom: TabBar(
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
            text: !isMobile(context) ? titles[0] : null,
          ),
          Tab(
            icon: const Icon(Typicons.th_large_outline),
            text: !isMobile(context) ? titles[1] : null,
          ),
          Tab(
            icon: const Icon(FontAwesome.calc),
            text: !isMobile(context) ? titles[2] : null,
          ),
          Tab(
            icon: const Icon(Icons.car_repair),
            text: !isMobile(context) ? titles[3] : null,
          ),
          Tab(
            icon: const Icon(Typicons.news),
            text: !isMobile(context) ? titles[4] : null,
          ),
          Tab(
            icon: const Icon(CupertinoIcons.building_2_fill),
            text: !isMobile(context) ? titles[5] : null,
          ),
          Tab(
            icon: const Icon(CupertinoIcons.map_pin_ellipse),
            text: !isMobile(context) ? titles[6] : null,
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
