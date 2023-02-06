import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sidebarx/sidebarx.dart';

import '../components/constants.dart';
import '../controller/controller.dart';
import '../models/producers/Section.dart';

final Controller c = Get.put(Controller());

class CatalogInside extends StatefulWidget {
  const CatalogInside({Key? key}) : super(key: key);

  @override
  State<CatalogInside> createState() => _CatalogInsideState();
}

class _CatalogInsideState extends State<CatalogInside> {
  final _controllerSidebar = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();




  @override
  void initState() {
    super.initState();
    c.listProducer.forEach((element) {
      element.modelSet!.forEach((element) {
        int i = c.listSection
            .indexWhere((element1) => element1.name == element.name);
        if (i == -1) {
          c.listSection.add(element.section!);
        } else {
          print(element.section!.name);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            key: _key,
            body: Row(
              children: [
                ExampleSidebarX(controller: _controllerSidebar),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controllerSidebar,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    var seen = Set<String>();
    List<Section> uniquelist =
    c.listSection.where((section) => seen.add(section.name!)).toList();
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 30,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      items: List.generate(
          uniquelist.length,
              (index) => SidebarXItem(
              iconWidget:  Image.network(
                'https://admin.tascom.uz:8083/api/download/section/${uniquelist[index].imagepath}',
                fit: BoxFit.fill,

              ),
              label: uniquelist[index].name)
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
          default:
            return Text(
              pageTitle,
              style: TextStyle(color: Colors.black),
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}