import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasuz_web/components/constants.dart';
import '../components/onhover.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';
import '../models/catalog_service_item.dart';

final Controller _controller = Get.put(Controller());

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  CatalogServiceItem? catalogServiceItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: stylePageBackground(context),
      height: isMobile(context)
          ? MediaQuery.of(context).size.height * 2
          : MediaQuery.of(context).size.height * 2.1,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              SvgPicture.asset(
                "assets/images/tassvg.svg",
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              Text('Сервисный центр', style: styleTitle(context)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "TAS стремится к высочайшему качеству обслуживания во всех аспектах работы. Наша цель состоит в том, чтобы обеспечить ценность за счет высококачественного ремонта автомобилей, обслуживания клиентов и доступных цен. TAS предлагает комплексные услуги, выходящие за рамки общего ремонта. Мы предлагаем лучший сервис по разумной цене."
            " От рабочей этики до делового взаимодействия наша цель — всегда быть честными и понимающими. "
            "Мы ценим наши долгосрочные отношения с клиентами, сообществами, поставщиками и арендодателями.",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17,  color: Colors.black.withOpacity(0.6)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          getCatalog(),
        ],
      ),
    );
  }

  Future<void> showdialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(100),
            content: Container(
              height: !isMobile(context)
                  ? MediaQuery.of(context).size.height / 1
                  : MediaQuery.of(context).size.height / 1,
              width: !isMobile(context)
                  ? MediaQuery.of(context).size.width / 1.5
                  : MediaQuery.of(context).size.width / 1,
              child: Expanded(
                child: !isMobile(context)
                    ? Row(
                        children: [
                          catalogServiceItem!.imageDialog,
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: !isMobile(context)
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.center,
                                crossAxisAlignment: !isMobile(context)
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      catalogServiceItem!.icon,
                                      IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(
                                            Icons.cancel_outlined,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    catalogServiceItem!.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    catalogServiceItem!.description,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    catalogServiceItem!.descriptionDialog,
                                    style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          catalogServiceItem!.imageDialog,
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: !isMobile(context)
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.center,
                                crossAxisAlignment: !isMobile(context)
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      catalogServiceItem!.icon,
                                      IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(
                                            Icons.cancel_outlined,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    catalogServiceItem!.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    catalogServiceItem!.description,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    catalogServiceItem!.descriptionDialog,
                                    style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        });
  }

  Widget getCatalog() {
    if (isMobile(context)) assert(debugCheckHasMaterial(context));
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(15),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: !isMobile(context) ? 13 / 8 : 3 / 3,
          crossAxisCount: !isMobile(context) ? 3 : 2,
          crossAxisSpacing: !isMobile(context) ? 20 : 10,
          mainAxisSpacing: !isMobile(context) ? 20 : 10,
        ),
        itemCount: _controller.listCatalogServiceItem.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            switch (index) {
              case 0:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 1:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 2:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 3:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 4:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 5:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 6:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 7:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 8:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 9:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 10:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
              case 11:
                {
                  catalogServiceItem =
                      _controller.listCatalogServiceItem[index];
                  showdialog();
                }
                break;
            }
          },
          child: OnHover(
            builder: (isHovered) {
              final color = isHovered
                  ? Colors.yellow.shade400
                  : Color.fromRGBO(235, 235, 235, 95);
              return PhysicalModel(
                color: Colors.white60,
                shadowColor: Colors.lime,
                elevation: isHovered ? 10 : 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: color,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ShaderMask(
                                blendMode: BlendMode.srcATop,
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                      Colors.yellow,
                                      Colors.black
                                    ]).createShader(bounds),
                                child: _controller
                                    .listCatalogServiceItem[index].icon,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  _controller
                                      .listCatalogServiceItem[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isDesktop(context) ? 20 : 12,
                                    fontWeight: isHovered
                                        ? FontWeight.w900
                                        : FontWeight.bold,
                                  ),
                                ),
                              ))
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            _controller
                                .listCatalogServiceItem[index].description
                                .toString(),
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: TextStyle(
                              color: isHovered
                                  ? Colors.lightBlueAccent
                                  : Colors.black54,
                              fontSize: isDesktop(context) ? 17 : 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Читать далее → ",
                          style: TextStyle(
                            color: isHovered
                                ? Colors.black
                                : Colors.black54,
                            fontSize: isDesktop(context) ? 17 : 10,
                            fontStyle: FontStyle.italic,
                            fontWeight: isHovered ? FontWeight.w500 :FontWeight.normal
                          ),)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
