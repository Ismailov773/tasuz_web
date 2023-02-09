import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasuz_web/components/constants.dart';
import 'package:tasuz_web/models/producers/ModelSet.dart';
import 'package:tasuz_web/models/producers/OptionSet.dart';
import 'package:tasuz_web/models/producers/Section.dart';
import 'package:tasuz_web/screen/catalog_select_page.dart';
import '../components/onhover.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';


class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final Controller _controller = Get.put(Controller());

  List<ModelSet> _listModelset = [];
  List<OptionSet> _listOptionset = [];

  int selectedIndex = 0;

  var seen = <String>{};
  List<Section> uniquelist = [];
  


  

  @override
  void initState() {
    super.initState();

    for (var element in _controller.listProducer) {
      for (var element in element.modelSet!) {
        int i = _controller.listSection
            .indexWhere((element1) => element1.id == element.id);
        if (i == -1) {
          _controller.listSection.add(element.section!);
        } else {
          if (kDebugMode) {
            print(element.section!.id);
          }
        }
      }
    }

    for (var element in _controller.listModelSet) {
      for (var element in element.optionSet!) {
        int i = _controller.listOptionSet
            .indexWhere((element1) => element1.id == element.id);
        if (i == -1) {
          _controller.listOptionSet.add(element);
        } else {
          if (kDebugMode) {
            print(element.id);
          }
        }
      }
    }

    uniquelist = _controller.listSection
        .where((section) => seen.add(section.name!))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          decoration: stylePageBackground(context),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(right: !isMobile(context) ? 10 : 10),
            child: Column(
              mainAxisAlignment: !isMobile(context)
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: !isMobile(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/tassvg.svg",
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    Text('Каталоги', style: styleTitle(context)),
                  ],
                ),
                const Text(
                  "Работа напрямую с производителями позволяет предоставлять клиенту лучшую цену на рынке спецтехники",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  // margin: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 1.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NavigationRail(
                        groupAlignment: isMobile(context) ? -1.0 : 0.0,
                        minWidth: isMobile(context) ? 30.0 : 70.0,
                        selectedIndex: selectedIndex,
                        useIndicator: true,
                        indicatorColor: Colors.yellow.shade400,
                        onDestinationSelected: (int index) {
                          _listModelset = [];
                          _listOptionset = [];
                          for (var element in _controller.listProducer) {
                            _listModelset.addAll(element.modelSet!
                                .where((mod) =>
                                    mod.section!.id == uniquelist[index].id)
                                .toList());
                          }
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        labelType: isMobile(context)
                            ? NavigationRailLabelType.none
                            : NavigationRailLabelType.all,
                        selectedLabelTextStyle: const TextStyle(
                          color: Colors.lightBlueAccent,
                        ),
                        unselectedLabelTextStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                        destinations:
                        List.generate(
                            uniquelist.length,
                            (index) => NavigationRailDestination(
                                  padding: isMobile(context)
                                      ? const EdgeInsets.symmetric(vertical: 0)
                                      : const EdgeInsets.symmetric(vertical: 9),
                                  icon: Image.network(
                                    'https://admin.tascom.uz:8083/api/download/section/${uniquelist[index].imagepath}',
                                    fit: BoxFit.fill,
                                    height: 32,
                                  ),
                                  label: Text(uniquelist[index].name!),
                                )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          child: getCatalog(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView getCatalog() {
    var numberFormat = NumberFormat();
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: isMobile(context) ? 2 / 2.8 : 6 / 5,
        crossAxisCount: !isMobile(context) ? 3 : 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: _listModelset.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          setState(() {
            _controller.changeModelSet(_listModelset[index]);
            for (var element in _controller.listModelSet) {
              _listOptionset.addAll(element.optionSet!
                  .where((mod) => mod.id == _listModelset[index].id)
                  .toList());
              _controller.changeOptionSet(_listOptionset[index]);
              // print();
            }
            Get.to(const CatalogSelectPage());
          });
        },
        child: OnHover(
          builder: (isHovered) {
            final color = isHovered ? Colors.yellow.shade400 : white;
            return PhysicalModel(
                color: Colors.white60,
                shadowColor: Colors.lime,
                elevation: isHovered ? 10 : 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_listModelset[index].section!.name!}: ${_listModelset[index].producername} (китай)",
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 20 : 10,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        'https://admin.tascom.uz:8083/api/download/model/${_listModelset[index].imagepath}',
                        width: isMobile(context)
                            ? MediaQuery.of(context).size.width / 2
                            : MediaQuery.of(context).size.width / 5,
                        height: isMobile(context)
                            ? MediaQuery.of(context).size.height / 3
                            : MediaQuery.of(context).size.height / 4,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        (_listModelset[index].name).toString(),
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 20 : 10,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "цены от: ",
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            // "${(_listModelset[index].priceuzs).toString()}",
                            "${numberFormat.format(_listModelset[index].priceuzs)} cум ",
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: isDesktop(context) ? 18 : 10,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
